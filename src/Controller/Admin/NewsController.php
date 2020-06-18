<?php


namespace App\Controller\Admin;

use App\Entity\News;
use App\Form\NewsType;
use App\Repository\NewsRepository;
use App\Security\NewsVoter;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * Controller used to manage news contents in the backend.
 *
 * @Route("/admin/news")
 * @IsGranted("ROLE_ADMIN")
 */
class NewsController extends AbstractController
{
    /**
     * Lists all news entities.
     *
     * @Route("/", methods="GET", name="admin_news_index")
     */
    public function index(NewsRepository $news): Response
    {
        $authorNews = $news->findBy(['author' => $this->getUser()], ['publishedAt' => 'DESC']);

        return $this->render('admin/news/index.html.twig', ['newses' => $authorNews]);
    }

    /**
     * Creates a new news entity.
     *
     * @Route("/new", methods="GET|POST", name="admin_news_new")
     *
     */
    public function new(Request $request): Response
    {
        $news = new News();
        $news->setAuthor($this->getUser());

        $form = $this->createForm(NewsType::class, $news)
            ->add('saveAndCreateNew', SubmitType::class);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($news);
            $em->flush();


            $this->addFlash('success', 'news.created_successfully');

            if ($form->get('saveAndCreateNew')->isClicked()) {
                return $this->redirectToRoute('admin_news_new');
            }

            return $this->redirectToRoute('admin_news_index');
        }

        return $this->render('admin/news/new.html.twig', [
            'news' => $news,
            'form' => $form->createView(),
        ]);
    }

    /**
     * Finds and displays a News entity.
     *
     * @Route("/{id<\d+>}", methods="GET", name="admin_news_show")
     */
    public function show(News $news): Response
    {

        $this->denyAccessUnlessGranted(NewsVoter::SHOW, $news, 'News can only be shown to their authors.');

        return $this->render('admin/news/show.html.twig', [
            'news' => $news,
        ]);
    }

    /**
     * Displays a form to edit an existing News entity.
     *
     * @Route("/{id<\d+>}/edit", methods="GET|POST", name="admin_news_edit")
     * @IsGranted("edit", subject="news", message="News can only be edited by their authors.")
     */
    public function edit(Request $request, News $news): Response
    {
        $form = $this->createForm(NewsType::class, $news);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            $this->addFlash('success', 'news.updated_successfully');

            return $this->redirectToRoute('admin_news_edit', ['id' => $news->getId()]);
        }

        return $this->render('admin/news/edit.html.twig', [
            'news' => $news,
            'form' => $form->createView(),
        ]);
    }

    /**
     * Deletes a News entity.
     *
     * @Route("/{id}/delete", methods="POST", name="admin_news_delete")
     * @IsGranted("delete", subject="news")
     */
    public function delete(Request $request, News $news): Response
    {
        if (!$this->isCsrfTokenValid('delete', $request->request->get('token'))) {
            return $this->redirectToRoute('admin_news_index');
        }

        $news->getTags()->clear();

        $em = $this->getDoctrine()->getManager();
        $em->remove($news);
        $em->flush();

        $this->addFlash('success', 'news.deleted_successfully');

        return $this->redirectToRoute('admin_news_index');
    }
}
