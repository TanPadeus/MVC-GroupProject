<?php


namespace App\Controller;

use App\Entity\News;
use App\Repository\NewsRepository;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Cache;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * Controller used to manage blog contents in the public part of the site.
 *
 * @Route("/news")
 *
 */
class NewsController extends AbstractController
{
    /**
     * @Route("/", defaults={"page": "1", "_format"="html"}, methods="GET", name="news_index")
     * @Route("/page/{page<[1-9]\d*>}", defaults={"_format"="html"}, methods="GET", name="news_index_paginated")
     * @Cache(smaxage="10")
     *
     */
    public function index(int $page, NewsRepository $news): Response
    {
        $latestNews = $news->findLatest($page);

        return $this->render('news/index.html.twig', [
            'paginator' => $latestNews,
        ]);
    }

    /**
     * @Route("/news/{slug}", methods="GET", name="news_post")
     *
     */
    public function newsShow(News $news): Response
    {
        return $this->render('news/news_show.html.twig', ['news' => $news]);
    }
}
