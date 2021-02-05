<?php

namespace App\Controller;

use App\Entity\Categorie;
use App\Entity\Favoris;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Produit;
use App\Entity\Utilisateur;

/**
 * @Route("/collection")
 * @method render(string $string, array $array)
 */
class CollectionController extends AbstractController
{
    /**
     * @Route("/{id}", name="collection")
     */
    public function index(int $id): Response
    {
        $categorie = $this->getDoctrine()->getRepository(Categorie::class)->find($id);
        $listeProduits = $this->getDoctrine()->getRepository(Produit::class)->findByProduitOfCategorie($categorie);
        $categories = $this->getDoctrine()->getRepository(Categorie::class)->findBy(array(), array('libelle' => 'ASC'));
        // affichage de la page d'accueil
        return $this->render('collection/collection.html.twig', [
            'informations' => $listeProduits,
            'categorie' => $categorie,
            'collections' => $categories,
        ]);
    }
    

     /**
     * @Route("/{id}/{idUtilisateur}/add_favoris/{idProduit}", name="add_favoris_route")
     */
    public function addFavorisAction(int $id, int $idUtilisateur, int $idProduit): Response
    {

        $em = $this->getDoctrine()->getManager();

        $favoris = $em->getRepository(Favoris::class)->find($idUtilisateur);
        $produit = $em->getRepository(Produit::class)->find($idProduit);
        $favoris->addProduit($produit);
        $em->persist($favoris);
        $em->flush();
        
        $categorie = $this->getDoctrine()->getRepository(Categorie::class)->find($id);
        $listeProduits = $this->getDoctrine()->getRepository(Produit::class)->findByProduitOfCategorie($categorie);
        $categories = $this->getDoctrine()->getRepository(Categorie::class)->findBy(array(), array('libelle' => 'ASC'));
        // affichage de la page d'accueil
        return $this->render('collection/collection.html.twig', [
            'informations' => $listeProduits,
            'categorie' => $categorie,
            'collections' => $categories,
        ]);
    }
    
    /**
     * @Route("/{id}/{idUtilisateur}/delete_favoris/{idFavoris}", name="delete_favoris_route")
     */
    public function deleteFavorisAction(int $id, int $idUtilisateur, int $idFavoris): Response
    {

        $em = $this->getDoctrine()->getManager();

        $favoris = $em->getRepository(Favoris::class)->find($idUtilisateur);
        $produit = $em->getRepository(Produit::class)->find($idFavoris);
        $favoris->removeProduit($produit);
        $em->persist($favoris);
        $em->flush();

        $categorie = $this->getDoctrine()->getRepository(Categorie::class)->find($id);
        $listeProduits = $this->getDoctrine()->getRepository(Produit::class)->findByProduitOfCategorie($categorie);
        $categories = $this->getDoctrine()->getRepository(Categorie::class)->findBy(array(), array('libelle' => 'ASC'));
        // affichage de la page d'accueil
        return $this->render('collection/collection.html.twig', [
            'informations' => $listeProduits,
            'categorie' => $categorie,
            'collections' => $categories,
        ]);
    }
}
