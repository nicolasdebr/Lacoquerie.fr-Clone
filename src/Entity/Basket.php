<?php

namespace App\Entity;

use App\Repository\BasketRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=BasketRepository::class)
 */
class Basket
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="integer")
     */
    private $Basket_quantity;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $Basket_user_email;

    /**
     * @ORM\Column(type="integer")
     */
    private $Basket_pro_id;

    /**
     * @ORM\OneToOne(targetEntity=User::class, mappedBy="user_panier_produit", cascade={"persist", "remove"})
     */
    private $panier_user_id;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getBasketQuantity(): ?int
    {
        return $this->Basket_quantity;
    }

    public function setBasketQuantity(int $Basket_quantity): self
    {
        $this->Basket_quantity = $Basket_quantity;

        return $this;
    }

    public function getBasketUserEmail(): ?string
    {
        return $this->Basket_user_email;
    }

    public function setBasketUserEmail(string $Basket_user_email): self
    {
        $this->Basket_user_email = $Basket_user_email;

        return $this;
    }

    public function getBasketProId(): ?int
    {
        return $this->Basket_pro_id;
    }

    public function setBasketProId(int $Basket_pro_id): self
    {
        $this->Basket_pro_id = $Basket_pro_id;

        return $this;
    }

    public function getPanierUserId(): ?User
    {
        return $this->panier_user_id;
    }

    public function setPanierUserId(?User $panier_user_id): self
    {
        $this->panier_user_id = $panier_user_id;

        // set (or unset) the owning side of the relation if necessary
        $newUser_panier_produit = null === $panier_user_id ? null : $this;
        if ($panier_user_id->getUserPanierProduit() !== $newUser_panier_produit) {
            $panier_user_id->setUserPanierProduit($newUser_panier_produit);
        }

        return $this;
    }
}
