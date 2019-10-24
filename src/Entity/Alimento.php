<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\AlimentoRepository")
 */
class Alimento
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
    private $nombre;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\AlimentoXreg", mappedBy="alimento")
     */
    private $alimentoXregs;



    public function __construct($nombre=null)
    {
        $this->nombre = $nombre;
        $this->alimentoXregs = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNombre(): ?string
    {
        return $this->nombre;
    }

    public function setNombre(string $nombre): self
    {
        $this->nombre = $nombre;

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
            $alimentoXreg->setAlimento($this);
        }

        return $this;
    }

    public function removeAlimentoXreg(AlimentoXreg $alimentoXreg): self
    {
        if ($this->alimentoXregs->contains($alimentoXreg)) {
            $this->alimentoXregs->removeElement($alimentoXreg);
            // set the owning side to null (unless already changed)
            if ($alimentoXreg->getAlimento() === $this) {
                $alimentoXreg->setAlimento(null);
            }
        }

        return $this;
    }

  
}
