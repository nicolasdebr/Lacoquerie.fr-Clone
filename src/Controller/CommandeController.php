<?php

namespace App\Controller;

use App\Entity\Utilisateur;
use App\Entity\Produit;
use App\Entity\Commande;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Dompdf\Dompdf;
use Dompdf\Options;

class CommandeController extends AbstractController
{
    /**
     * @Route("/commande", name="commande")
     */
    public function index(SessionInterface $session ): Response
    {
        $panier = $session->get('panier',[]);

        $panierPlein=[];
        foreach($panier as $id => $quantity){
            $panierPlein[]=[
                'produit' => $this->getDoctrine()->getRepository(Produit::class)->find($id),
                'quantity'=> $quantity
            ];
        }
        $total =0;
        foreach($panierPlein as $item){
         $totalItem = $item['produit']->getPrix() * $item['quantity'];
         $total += $totalItem;
        }
        return $this->render('facture/final_payment.html.twig', [
            'items' => $panierPlein,
            'total' => $total
        ]);
    }
    /**
     * @Route("/enregistrement", name="enregistrement_commande")
     */
    public function enregistrement(SessionInterface $session)
    {
        $panier = $session->get('panier',[]);
        $user = $this->getUser();
        $panierPlein=[];
        foreach($panier as $id => $quantity){
            $panierPlein[]=[
                'produit' => $this->getDoctrine()->getRepository(Produit::class)->find($id),
                'quantity'=> $quantity
            ];          
        } 
        $total =0;
        foreach($panierPlein as $item){
         $totalItem = $item['produit']->getPrix() * $item['quantity'];
         $total += $totalItem;
        }

        $em = $this->getDoctrine()->getManager();
        $commande = new Commande();
        $commande->setUtilisateur($user);
        $commande->setDate(new \DateTime());
        $commande->setMontant($total);
        $commande->setStatut("Expédiée");
        $commande->setAdresseLibelle($user->getAdresseLibelle());
        $commande->setAdresseCp($user->getAdresseCp());
        $commande->setVille($user->getVille());
        $commande->setPays($user->getPays());
        
        foreach($panier as $id => $quantity){
            $produits_commande= $this->getDoctrine()->getRepository(Produit::class)->find($id);
            $produits_commande->setStock($produits_commande->getStock()-$quantity);
            $commande->addProduit($produits_commande);
        }


        $em->persist($commande);
        $em->flush();
        $lastId = $commande->getId();
       
        unset($panier);
        $session->set('panier',[]);
        return $this->render('commande/index.html.twig', [
            'controller_name' => 'CommandeController',
        ]);
        
        
    }
}
