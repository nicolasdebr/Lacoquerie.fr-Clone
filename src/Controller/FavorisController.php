<?php

namespace App\Controller;

use App\Entity\Categorie;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Utilisateur;
use App\Entity\Favoris;
use App\Entity\Produit;

/**
 * @Route("/favoris")
 * @method render(string $string, array $array)
 */
class FavorisController extends AbstractController
{
    /**
     * @Route("/{id}", name="favoris")
     */
    public function index(int $id): Response
    {
        $client = $this->getDoctrine()->getRepository(Utilisateur::class)->find($id);
        if(is_null($client->getFavoris()->getProduits())){
            return $this->render('accueil/index.html.twig');
        }
        else{
            $informations = $client->getFavoris()->getProduits();
            //affichage de la page d'accueil
            return $this->render('favoris/favoris.html.twig', [
                'favoris' => $informations,
            ]);
        }

    }
}
