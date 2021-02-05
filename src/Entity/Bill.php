<?php

namespace App\Entity;

use App\Repository\BillRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=BillRepository::class)
 */
class Bill
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
    private $Bill_date;

    /**
     * @ORM\Column(type="float")
     */
    private $Bill_total;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $Bill_ids_product;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getBillDate(): ?\DateTimeInterface
    {
        return $this->Bill_date;
    }

    public function setBillDate(\DateTimeInterface $Bill_date): self
    {
        $this->Bill_date = $Bill_date;

        return $this;
    }

    public function getBillTotal(): ?float
    {
        return $this->Bill_total;
    }

    public function setBillTotal(float $Bill_total): self
    {
        $this->Bill_total = $Bill_total;

        return $this;
    }

    public function getBillIdsProduct(): ?string
    {
        return $this->Bill_ids_product;
    }

    public function setBillIdsProduct(string $Bill_ids_product): self
    {
        $this->Bill_ids_product = $Bill_ids_product;

        return $this;
    }
}
