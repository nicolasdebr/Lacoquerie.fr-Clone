<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Produit;
use App\Entity\Commentaire;
use App\Form\CommentaireFormType;
use DateTime;
use Symfony\Component\HttpFoundation\Request;

/**
 * @Route("/produit")
 * @method render(string $string, array $array)
 */
class FicheProduitController extends AbstractController
{
    /**
     * @Route("/{id}", name="produit")
     */
    public function index(int $id, Request $request): Response
    {
        $produit = $this->getDoctrine()->getRepository(Produit::class)->find($id);
        $commentaires = $this->getDoctrine()->getRepository(Commentaire::class)->findByProduit($produit);


        //On intancie l'entité commentaire pour en ajouter un nouveau
        $commentaire = new Commentaire();
        //nous créons l'objet formulaire
        $form = $this->createForm(CommentaireFormType::class, $commentaire);

        //On récupère les données saisies
        $form->handleRequest($request);
        //On vérifie si le formulaire a été envoyé et si les données sont valides
        if ($form->isSubmitted() && $form->isValid()) {
            $commentaire->setProduit($produit);
            $commentaire->setDate(new DateTime('now'));
            //on instancie Doctrine
            $doctrine = $this->getDoctrine()->getManager();
            //on hydrate $commentaire
            $doctrine->persist($commentaire);
            //on ecrit dans la base
            $doctrine->flush();

            unset($commentaire);
            unset($form);
            $commentaire = new Commentaire();
            $form = $this->createForm(CommentaireFormType::class, $commentaire);
            return $this->redirect($this->generateUrl('produit', [
                'id' => $produit->getId()
            ]));
        }

        // affichage de la page d'accueil
        return $this->render('produit/produit.html.twig', [
            'info' => $produit,
            'commentaires' => $commentaires,
            'formComment' => $form->createView(),
        ]);
    }
}
