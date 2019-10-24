<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\RegistroAlimentacionRepository")
 */
class RegistroAlimentacion
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="date")
     */
    private $fecha;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $asistentes;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $observaciones;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $horarioComida;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\AlimentoXreg", mappedBy="registro")
     */
    private $alimentoXregs;


    public function __construct()
    {
        $this->alimentoXregs = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getFecha(): ?\DateTimeInterface
    {
        return $this->fecha;
    }

    public function setFecha(\DateTimeInterface $fecha): self
    {
        $this->fecha = $fecha;

        return $this;
    }

    public function getAsistentes(): ?string
    {
        return $this->asistentes;
    }

    public function setAsistentes(string $asistentes): self
    {
        $this->asistentes = $asistentes;

        return $this;
    }

    public function getObservaciones(): ?string
    {
        return $this->observaciones;
    }

    public function setObservaciones(string $observaciones): self
    {
        $this->observaciones = $observaciones;

        return $this;
    }

    public function getHorarioComida(): ?string
    {
        return $this->horarioComida;
    }

    public function setHorarioComida(string $horarioComida): self
    {
        $this->horarioComida = $horarioComida;

        return $this;
    }


    /**
     * @return Collection|AlimentoXreg[]
     */
    public function getAlimentoXregs(): Collection
    {
        return $this->alimentoXregs;
    }

    public function addAlimentoXreg(AlimentoXreg $alimentoXreg): self
    {
        if (!$this->alimentoXregs->contains($alimentoXreg)) {
            $this->alimentoXregs[] = $alimentoXreg;
            $alimentoXreg->setRegistro($this);
        }

        return $this;
    }

    public function removeAlimentoXreg(AlimentoXreg $alimentoXreg): self
    {
        if ($this->alimentoXregs->contains($alimentoXreg)) {
            $this->alimentoXregs->removeElement($alimentoXreg);
            // set the owning side to null (unless already changed)
            if ($alimentoXreg->getRegistro() === $this) {
                $alimentoXreg->setRegistro(null);
            }
        }

        return $this;
    }

    
}
