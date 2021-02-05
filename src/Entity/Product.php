<?php

namespace App\Entity;

use App\Repository\ProductRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=ProductRepository::class)
 */
class Product
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
    
    private $pro_name;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $pro_ref;

    /**
     * @ORM\Column(type="integer")
     */
    private $pro_prix;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $pro_img;

    /**
     * @ORM\Column(type="integer")
     */
    private $pro_stock;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $pro_des;

    /**
     * @ORM\ManyToOne(targetEntity=category::class, inversedBy="products")
     * @ORM\JoinColumn(nullable=false)
     */
    private $cat_id;

    /**
     * @ORM\OneToMany(targetEntity=Commentary::class, mappedBy="com_pro_id")
     */
    private $commentaries;

    /**
     * @ORM\ManyToMany(targetEntity=Favoris::class, mappedBy="pro_id")
     */
    private $favoris;

    public function __construct()
    {
        $this->commentaries = new ArrayCollection();
        $this->favoris = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }


    public function getProName(): ?string
    {
        return $this->pro_name;
    }

    public function setProName(string $pro_name): self
    {
        $this->pro_name = $pro_name;

        return $this;
    }

    public function getProRef(): ?string
    {
        return $this->pro_ref;
    }

    public function setProRef(string $pro_ref): self
    {
        $this->pro_ref = $pro_ref;

        return $this;
    }

    public function getProPrix(): ?int
    {
        return $this->pro_prix;
    }

    public function setProPrix(int $pro_prix): self
    {
        $this->pro_prix = $pro_prix;

        return $this;
    }

    public function getProImg(): ?string
    {
        return $this->pro_img;
    }

    public function setProImg(string $pro_img): self
    {
        $this->pro_img = $pro_img;

        return $this;
    }

    public function getProStock(): ?int
    {
        return $this->pro_stock;
    }

    public function setProStock(int $pro_stock): self
    {
        $this->pro_stock = $pro_stock;

        return $this;
    }

    public function getProDes(): ?string
    {
        return $this->pro_des;
    }

    public function setProDes(string $pro_des): self
    {
        $this->pro_des = $pro_des;

        return $this;
    }

    public function getCatId(): ?category
    {
        return $this->cat_id;
    }

    public function setCatId(?category $cat_id): self
    {
        $this->cat_id = $cat_id;

        return $this;
    }

    /**
     * @return Collection|Commentary[]
     */
    public function getCommentaries(): Collection
    {
        return $this->commentaries;
    }

    public function addCommentary(Commentary $commentary): self
    {
        if (!$this->commentaries->contains($commentary)) {
            $this->commentaries[] = $commentary;
            $commentary->setComProId($this);
        }

        return $this;
    }

    public function removeCommentary(Commentary $commentary): self
    {
        if ($this->commentaries->removeElement($commentary)) {
            // set the owning side to null (unless already changed)
            if ($commentary->getComProId() === $this) {
                $commentary->setComProId(null);
            }
        }

        return $this;
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
            $favori->addProId($this);
        }

        return $this;
    }

    public function removeFavori(Favoris $favori): self
    {
        if ($this->favoris->removeElement($favori)) {
            $favori->removeProId($this);
        }

        return $this;
    }
}
