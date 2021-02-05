<?php

namespace App\Controller;

use App\Entity\Categorie;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Commande;
use App\Entity\Utilisateur;


class AccueilController extends AbstractController
{
    /**
     * @Route("/", name="accueil")
     */
    public function index(): Response
    {
        $user = $this->getUser();
        $collections = $this->getDoctrine()->getRepository(Categorie::class)->findAll();
        return $this->render('accueil/index.html.twig', [
            'controller_name' => 'AccueilController',
            'user' => $user,
            'collections' =>$collections,
        ]);
    }
    /**
     * @Route("/client", name="client")
     */
    public function client(): response
    {
        $user = $this->getUser();
        //$client = $this->getDoctrine()->getRepository(Utilisateur::class)->find($user);
        $commandes = $user->getCommandes();
        return $this->render('accueil/client.html.twig', 
    [
        'user' =>$user,
        'commandes' => $commandes,
    ]);
    }

    /**
     * @Route("/engagement", name="engagement")
     */
    public function engagement(): Response
    {
        $user = $this->getUser();
        
        return $this->render('accueil/engagement.html.twig', [
            'controller_name' => 'AccueilController',
            'user' => $user,
            
        ]);
    }

    /**
     * @Route("/livraisons", name="livraisons")
     */
    public function livraisons(): Response
    {
        $user = $this->getUser();
        
        return $this->render('accueil/livraisons.html.twig', [
            'controller_name' => 'AccueilController',
            'user' => $user,
            
        ]);
    }

    /**
     * @Route("/confidentialite", name="confidentialite")
     */
    public function confidentialite(): Response
    {
        $user = $this->getUser();
        
        return $this->render('accueil/confidentialite.html.twig', [
            'controller_name' => 'AccueilController',
            'user' => $user,
            
        ]);
    }

    /**
     * @Route("/conditions", name="conditions")
     */
    public function conditions(): Response
    {
        $user = $this->getUser();
        
        return $this->render('accueil/conditions.html.twig', [
            'controller_name' => 'AccueilController',
            'user' => $user,
            
        ]);
    }

    /**
     * @Route("/mentionsLgl", name="mentionsLgl")
     */
    public function mentionsLgl(): Response
    {
        $user = $this->getUser();
        
        return $this->render('accueil/mentionsLgl.html.twig', [
            'controller_name' => 'AccueilController',
            'user' => $user,
            
        ]);
    }

    /**
     * @Route("/qr", name="qr")
     */
    public function qr(): Response
    {
        $user = $this->getUser();
        
        return $this->render('accueil/qr.html.twig', [
            'controller_name' => 'AccueilController',
            'user' => $user,
            
        ]);
    }
}
