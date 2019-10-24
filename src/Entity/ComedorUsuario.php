<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\ComedorUsuarioRepository")
 */
class ComedorUsuario
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\comedor", inversedBy="comedorUsuarios")
     * @ORM\JoinColumn(nullable=false)
     */
    private $comedor;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\user", inversedBy="comedorUsuarios")
     * @ORM\JoinColumn(nullable=false)
     */
    private $referente;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getComedor(): ?comedor
    {
        return $this->comedor;
    }

    public function setComedor(?comedor $comedor): self
    {
        $this->comedor = $comedor;

        return $this;
    }

    public function getReferente(): ?user
    {
        return $this->referente;
    }

    public function setReferente(?user $referente): self
    {
        $this->referente = $referente;

        return $this;
    }
}
