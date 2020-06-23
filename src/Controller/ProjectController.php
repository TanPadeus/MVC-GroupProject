<?php
// MADE BY MACIEJ MORYŃ

namespace App\Controller;

use App\Entity\Comment;
use App\Entity\Project;
use App\Events\CommentCreatedEvent;
use App\Form\CommentType;
use App\Repository\ProjectRepository;
use App\Repository\TagRepository;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Cache;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\EventDispatcher\EventDispatcherInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * Controller used to manage project contents in the public part of the site.
 *
 * @Route("/projects")
 *
 */
class ProjectController extends AbstractController
{
    /**
     * @Route("/", defaults={"page": "1", "_format"="html"}, methods="GET", name="projects_index")
     * @Route("/page/{page<[1-9]\d*>}", defaults={"_format"="html"}, methods="GET", name="projects_index_paginated")
     * @Cache(smaxage="10")
     *
     */
    public function index(Request $request, int $page, ProjectRepository $posts, TagRepository $tags): Response
    {
        $tag = null;
        if ($request->query->has('tag')) {
            $tag = $tags->findOneBy(['name' => $request->query->get('tag')]);
        }
        $latestPosts = $posts->findLatest($page, $tag);

        return $this->render('projects/index.html.twig', [
            'paginator' => $latestPosts,
        ]);
    }

    /**
     * @Route("/project/{slug}", methods="GET", name="projects_project")
     *
     */
    public function postShow(Project $post): Response
    {
        return $this->render('projects/project_show.html.twig', ['post' => $post]);
    }

    /**
     * @Route("/comment/{postSlug}/new", methods="POST", name="comment_new")
     * @IsGranted("IS_AUTHENTICATED_FULLY")
     * @ParamConverter("post", options={"mapping": {"postSlug": "slug"}})
     *
     */
    public function commentNew(Request $request, Project $post, EventDispatcherInterface $eventDispatcher): Response
    {
        $comment = new Comment();
        $comment->setAuthor($this->getUser());
        $post->addComment($comment);

        $form = $this->createForm(CommentType::class, $comment);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($comment);
            $em->flush();

            $eventDispatcher->dispatch(new CommentCreatedEvent($comment));

            return $this->redirectToRoute('projects_project', ['slug' => $post->getSlug()]);
        }

        return $this->render('projects/comment_form_error.html.twig', [
            'post' => $post,
            'form' => $form->createView(),
        ]);
    }

    /**
     * This controller is called directly via the render() function in the
     * project/post_show.html.twig template. That's why it's not needed to define
     * a route name for it.
     *
     * The "id" of the Project is passed in and then turned into a Project object
     * automatically by the ParamConverter.
     */
    public function commentForm(Project $post): Response
    {
        $form = $this->createForm(CommentType::class);

        return $this->render('projects/_comment_form.html.twig', [
            'post' => $post,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/search", methods="GET", name="projects_search")
     */
    public function search(Request $request, ProjectRepository $posts): Response
    {
        if (!$request->isXmlHttpRequest()) {
            return $this->render('projects/search.html.twig');
        }

        $query = $request->query->get('q', '');
        $limit = $request->query->get('l', 10);
        $foundPosts = $posts->findBySearchQuery($query, $limit);

        $results = [];
        foreach ($foundPosts as $post) {
            $results[] = [
                'title' => htmlspecialchars($post->getTitle(), ENT_COMPAT | ENT_HTML5),
                'date' => $post->getPublishedAt()->format('M d, Y'),
                'author' => htmlspecialchars($post->getAuthor()->getFullName(), ENT_COMPAT | ENT_HTML5),
                'summary' => htmlspecialchars($post->getSummary(), ENT_COMPAT | ENT_HTML5),
                'url' => $this->generateUrl('projects_project', ['slug' => $post->getSlug()]),
            ];
        }

        return $this->json($results);
    }
}
