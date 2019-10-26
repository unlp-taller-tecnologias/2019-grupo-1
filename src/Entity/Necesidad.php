<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\NecesidadRepository")
 */
class Necesidad
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $estado;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $descripcion;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\TipoNecesidad", inversedBy="necesidads")
     * @ORM\JoinColumn(nullable=false)
     */
    private $tipoNecesidad;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Comedor", inversedBy="necesidades")
     * @ORM\JoinColumn(nullable=false)
     */
    private $comedor;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEstado(): ?string
    {
        return $this->estado;
    }

    public function setEstado(string $estado): self
    {
        $this->estado = $estado;

        return $this;
    }

    public function getDescripcion(): ?string
    {
        return $this->descripcion;
    }

    public function setDescripcion(string $descripcion): self
    {
        $this->descripcion = $descripcion;

        return $this;
    }

    public function getTipoNecesidad(): ?tipoNecesidad
    {
        return $this->tipoNecesidad;
    }

    public function setTipoNecesidad(?tipoNecesidad $tipoNecesidad): self
    {
        $this->tipoNecesidad = $tipoNecesidad;

        return $this;
    }

    public function getComedor(): ?Comedor
    {
        return $this->comedor;
    }

    public function setComedor(?Comedor $comedor): self
    {
        $this->comedor = $comedor;

        return $this;
    }
}
