<?php

namespace App\Controller;

 
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\HttpFoundation\Request;
use App\Entity\Produit;

class PanierController extends AbstractController
{
    /**
     * @Route("/panier", name="panier")
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

        return $this->render('panier/panier.html.twig', [
            'items' => $panierPlein,
            'total' => $total
        ]);
    }
    /**
     * @Route("/panier/add/{id}", name="panier_add")
     */
    public function add($id, Request $request,SessionInterface $session)
    {
        $panier = $session->get('panier',[]);

        if(!empty($panier[$id])){
            $panier[$id]++;
        }else{
            $panier[$id]=1;
        }
        $session->set('panier', $panier);

        return $this->redirectToRoute("panier");
    }
    /**
     * @Route("/panier/removesingle/{id}", name="panier_remove_single")
     */
    public function removeSingle($id, Request $request,SessionInterface $session)
    {
        $panier = $session->get('panier',[]);
        if(!empty($panier[$id]) && $panier[$id] > 1 ){
            $panier[$id]--;
        }elseif($panier[$id] <= 1){
            unset($panier[$id]);
        }
        $session->set('panier', $panier);

        return $this->redirectToRoute("panier");
    }
    /**
     * @Route("/panier/remove/{id}", name="panier_remove" )
     */
    public function remove($id, SessionInterface $session){
        $panier = $session->get('panier',[]);

        if(!empty($panier[$id])){
            unset($panier[$id]);
        }
        $session->set('panier', $panier);
        return $this->redirectToRoute("panier");

    }
}
