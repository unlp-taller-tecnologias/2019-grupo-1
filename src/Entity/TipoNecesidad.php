<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\TipoNecesidadRepository")
 */
class TipoNecesidad
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
     * @ORM\OneToMany(targetEntity="App\Entity\Necesidad", mappedBy="TipoNecesidad")
     */
    private $necesidads;

    public function __construct()
    {
        $this->necesidads = new ArrayCollection();
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
     * @return Collection|Necesidad[]
     */
    public function getNecesidads(): Collection
    {
        return $this->necesidads;
    }

    public function addNecesidad(Necesidad $necesidad): self
    {
        if (!$this->necesidads->contains($necesidad)) {
            $this->necesidads[] = $necesidad;
            $necesidad->setTipoNecesidad($this);
        }

        return $this;
    }

    public function removeNecesidad(Necesidad $necesidad): self
    {
        if ($this->necesidads->contains($necesidad)) {
            $this->necesidads->removeElement($necesidad);
            // set the owning side to null (unless already changed)
            if ($necesidad->getTipoNecesidad() === $this) {
                $necesidad->setTipoNecesidad(null);
            }
        }

        return $this;
    }
}
