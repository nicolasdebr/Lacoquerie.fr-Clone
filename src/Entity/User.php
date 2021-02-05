<?php

namespace App\Entity;

use App\Repository\UserRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity(repositoryClass=UserRepository::class)
 * @UniqueEntity(fields={"email"}, message="There is already an account with this email")
 */
class User implements UserInterface
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=180, unique=true)
     */
    private $email;

    /**
     * @ORM\Column(type="json")
     */
    private $roles = [];

    /**
     * @var string The hashed password
     * @ORM\Column(type="string")
     */
    private $password;

    /**
     * @ORM\ManyToMany(targetEntity=Favoris::class, mappedBy="user_id")
     */
    private $favoris;

    /**
     * @ORM\OneToOne(targetEntity=Basket::class, inversedBy="panier_user_id", cascade={"persist", "remove"})
     */
    private $user_panier_produit;

    /**
     * @ORM\OneToMany(targetEntity=Orders::class, mappedBy="order_user_id")
     */
    private $user_order_produit;

    public function __construct()
    {
        $this->favoris = new ArrayCollection();
        $this->user_order_produit = new ArrayCollection();
    }

    

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }

    /**
     * A visual identifier that represents this user.
     *
     * @see UserInterface
     */
    public function getUsername(): string
    {
        return (string) $this->email;
    }

    /**
     * @see UserInterface
     */
    public function getRoles(): array
    {
        $roles = $this->roles;
        // guarantee every user at least has ROLE_USER
        $roles[] = 'ROLE_USER';

        return array_unique($roles);
    }

    public function setRoles(array $roles): self
    {
        $this->roles = $roles;

        return $this;
    }

    /**
     * @see UserInterface
     */
    public function getPassword(): string
    {
        return (string) $this->password;
    }

    public function setPassword(string $password): self
    {
        $this->password = $password;

        return $this;
    }

    /**
     * @see UserInterface
     */
    public function getSalt()
    {
        // not needed when using the "bcrypt" algorithm in security.yaml
    }

    /**
     * @see UserInterface
     */
    public function eraseCredentials()
    {
        // If you store any temporary, sensitive data on the user, clear it here
        // $this->plainPassword = null;
    }

    /**
     * @return Collection|Favoris[]
     */
    public function getFavoris(): Collection
    {
        return $this->favoris;
    }

    public function addFavori(Favoris $favori): self
    {
        if (!$this->favoris->contains($favori)) {
            $this->favoris[] = $favori;
            $favori->addUserId($this);
        }

        return $this;
    }

    public function removeFavori(Favoris $favori): self
    {
        if ($this->favoris->removeElement($favori)) {
            $favori->removeUserId($this);
        }

        return $this;
    }

    public function getUserPanierProduit(): ?Basket
    {
        return $this->user_panier_produit;
    }

    public function setUserPanierProduit(?Basket $user_panier_produit): self
    {
        $this->user_panier_produit = $user_panier_produit;

        return $this;
    }

    /**
     * @return Collection|Orders[]
     */
    public function getUserOrderProduit(): Collection
    {
        return $this->user_order_produit;
    }

    public function addUserOrderProduit(Orders $userOrderProduit): self
    {
        if (!$this->user_order_produit->contains($userOrderProduit)) {
            $this->user_order_produit[] = $userOrderProduit;
            $userOrderProduit->setOrderUserId($this);
        }

        return $this;
    }

    public function removeUserOrderProduit(Orders $userOrderProduit): self
    {
        if ($this->user_order_produit->removeElement($userOrderProduit)) {
            // set the owning side to null (unless already changed)
            if ($userOrderProduit->getOrderUserId() === $this) {
                $userOrderProduit->setOrderUserId(null);
            }
        }

        return $this;
    }


}
