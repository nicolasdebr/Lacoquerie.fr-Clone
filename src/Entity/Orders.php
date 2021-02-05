<?php

namespace App\Entity;

use App\Repository\OrdersRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=OrdersRepository::class)
 */
class Orders
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
    private $Order_date;

    /**
     * @ORM\Column(type="float")
     */
    private $Order_total_amount;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $Order_status;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $Order_ids_product;

    /**
     * @ORM\ManyToOne(targetEntity=User::class, inversedBy="user_order_produit")
     */
    private $order_user_id;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getOrderDate(): ?\DateTimeInterface
    {
        return $this->Order_date;
    }

    public function setOrderDate(\DateTimeInterface $Order_date): self
    {
        $this->Order_date = $Order_date;

        return $this;
    }

    public function getOrderTotalAmount(): ?float
    {
        return $this->Order_total_amount;
    }

    public function setOrderTotalAmount(float $Order_total_amount): self
    {
        $this->Order_total_amount = $Order_total_amount;

        return $this;
    }

    public function getOrderStatus(): ?string
    {
        return $this->Order_status;
    }

    public function setOrderStatus(string $Order_status): self
    {
        $this->Order_status = $Order_status;

        return $this;
    }

    public function getOrderIdsProduct(): ?string
    {
        return $this->Order_ids_product;
    }

    public function setOrderIdsProduct(string $Order_ids_product): self
    {
        $this->Order_ids_product = $Order_ids_product;

        return $this;
    }

    public function getOrderUserId(): ?User
    {
        return $this->order_user_id;
    }

    public function setOrderUserId(?User $order_user_id): self
    {
        $this->order_user_id = $order_user_id;

        return $this;
    }
}
