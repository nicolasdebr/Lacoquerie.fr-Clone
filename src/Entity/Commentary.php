<?php

namespace App\Entity;

use App\Repository\CommentaryRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=CommentaryRepository::class)
 */
class Commentary
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="datetime")
     */
    private $Com_date;

    /**
     * @ORM\Column(type="integer")
     */
    private $Com_rate;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $Com_des;

    /**
     * @ORM\Column(type="integer")
     */
    private $Com_pro_id;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $Com_img;

    /**
     * @ORM\ManyToOne(targetEntity=product::class, inversedBy="commentaries")
     * @ORM\JoinColumn(nullable=false)
     */
    private $com_pro_id;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getComDate(): ?\DateTimeInterface
    {
        return $this->Com_date;
    }

    public function setComDate(\DateTimeInterface $Com_date): self
    {
        $this->Com_date = $Com_date;

        return $this;
    }

    public function getComRate(): ?int
    {
        return $this->Com_rate;
    }

    public function setComRate(int $Com_rate): self
    {
        $this->Com_rate = $Com_rate;

        return $this;
    }

    public function getComDes(): ?string
    {
        return $this->Com_des;
    }

    public function setComDes(string $Com_des): self
    {
        $this->Com_des = $Com_des;

        return $this;
    }

    public function getComProId(): ?int
    {
        return $this->Com_pro_id;
    }

    public function setComProId(int $Com_pro_id): self
    {
        $this->Com_pro_id = $Com_pro_id;

        return $this;
    }

    public function getComImg(): ?string
    {
        return $this->Com_img;
    }

    public function setComImg(?string $Com_img): self
    {
        $this->Com_img = $Com_img;

        return $this;
    }
}
