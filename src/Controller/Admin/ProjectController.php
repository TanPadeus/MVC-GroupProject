<?php
// MADE BY MACIEJ MORYŃ

namespace App\Controller\Admin;

use App\Entity\Project;
use App\Form\ProjectType;
use App\Repository\ProjectRepository;
use App\Security\ProjectVoter;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * Controller used to manage projects contents in the backend.
 *
 * @Route("/admin/projects")
 * @IsGranted("ROLE_ADMIN")
 */
class ProjectController extends AbstractController
{
    /**
     * Lists all Project entities.
     *
     * This controller responds to two different routes with the same URL:
     *   * 'admin_post_index' is the route with a name that follows the same
     *     structure as the rest of the controllers of this class.
     *   * 'admin_index' is a nice shortcut to the backend homepage. This allows
     *     to create simpler links in the templates.
     *
     * @Route("/", methods="GET", name="admin_index")
     * @Route("/", methods="GET", name="admin_project_index")
     */
    public function index(ProjectRepository $posts): Response
    {
        $authorPosts = $posts->findBy(['author' => $this->getUser()], ['publishedAt' => 'DESC']);

        return $this->render('admin/projects/index.html.twig', ['posts' => $authorPosts]);
    }

    /**
     * Creates a new Project entity.
     *
     * @Route("/new", methods="GET|POST", name="admin_project_new")
     *
     */
    public function new(Request $request): Response
    {
        $post = new Project();
        $post->setAuthor($this->getUser());

        $form = $this->createForm(ProjectType::class, $post)
            ->add('saveAndCreateNew', SubmitType::class);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($post);
            $em->flush();


            $this->addFlash('success', 'project.created_successfully');

            if ($form->get('saveAndCreateNew')->isClicked()) {
                return $this->redirectToRoute('admin_project_new');
            }

            return $this->redirectToRoute('admin_project_index');
        }

        return $this->render('admin/projects/new.html.twig', [
            'post' => $post,
            'form' => $form->createView(),
        ]);
    }

    /**
     * Finds and displays a Project entity.
     *
     * @Route("/{id<\d+>}", methods="GET", name="admin_project_show")
     */
    public function show(Project $post): Response
    {

        $this->denyAccessUnlessGranted(ProjectVoter::SHOW, $post, 'Posts can only be shown to their authors.');

        return $this->render('admin/projects/show.html.twig', [
            'post' => $post,
        ]);
    }

    /**
     * Displays a form to edit an existing Project entity.
     *
     * @Route("/{id<\d+>}/edit", methods="GET|POST", name="admin_project_edit")
     * @IsGranted("edit", subject="post", message="Posts can only be edited by their authors.")
     */
    public function edit(Request $request, Project $post): Response
    {
        $form = $this->createForm(ProjectType::class, $post);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            $this->addFlash('success', 'project.updated_successfully');

            return $this->redirectToRoute('admin_project_edit', ['id' => $post->getId()]);
        }

        return $this->render('admin/projects/edit.html.twig', [
            'post' => $post,
            'form' => $form->createView(),
        ]);
    }

    /**
     * Deletes a Project entity.
     *
     * @Route("/{id}/delete", methods="POST", name="admin_project_delete")
     * @IsGranted("delete", subject="post")
     */
    public function delete(Request $request, Project $post): Response
    {
        if (!$this->isCsrfTokenValid('delete', $request->request->get('token'))) {
            return $this->redirectToRoute('admin_project_index');
        }

        $post->getTags()->clear();

        $em = $this->getDoctrine()->getManager();
        $em->remove($post);
        $em->flush();

        $this->addFlash('success', 'project.deleted_successfully');

        return $this->redirectToRoute('admin_project_index');
    }
}
