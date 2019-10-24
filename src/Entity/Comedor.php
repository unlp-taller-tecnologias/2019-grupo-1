<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\ComedorRepository")
 */
class Comedor
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
     * @ORM\Column(type="string", length=255)
     */
    private $direccion;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $descripcion;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $organizacion;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $foto;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $estado;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $telefono;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $redSocial;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $latitud;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $longitud;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $diaYhorario;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Necesidad", mappedBy="comedor")
     */
    private $necesidades;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\ComedorUsuario", mappedBy="comedor")
     */
    private $comedorUsuarios;

    public function __construct()
    {
        $this->necesidades = new ArrayCollection();
        $this->comedorUsuarios = new ArrayCollection();
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

    public function getDireccion(): ?string
    {
        return $this->direccion;
    }

    public function setDireccion(string $direccion): self
    {
        $this->direccion = $direccion;

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

    public function getOrganizacion(): ?string
    {
        return $this->organizacion;
    }

    public function setOrganizacion(string $organizacion): self
    {
        $this->organizacion = $organizacion;

        return $this;
    }

    public function getFoto(): ?string
    {
        return $this->foto;
    }

    public function setFoto(string $foto): self
    {
        $this->foto = $foto;

        return $this;
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

    public function getTelefono(): ?string
    {
        return $this->telefono;
    }

    public function setTelefono(string $telefono): self
    {
        $this->telefono = $telefono;

        return $this;
    }

    public function getRedSocial(): ?string
    {
        return $this->redSocial;
    }

    public function setRedSocial(string $redSocial): self
    {
        $this->redSocial = $redSocial;

        return $this;
    }

    public function getLatitud(): ?string
    {
        return $this->latitud;
    }

    public function setLatitud(string $latitud): self
    {
        $this->latitud = $latitud;

        return $this;
    }

    public function getLongitud(): ?string
    {
        return $this->longitud;
    }

    public function setLongitud(string $longitud): self
    {
        $this->longitud = $longitud;

        return $this;
    }

    public function getDiaYhorario(): ?string
    {
        return $this->diaYhorario;
    }

    public function setDiaYhorario(string $diaYhorario): self
    {
        $this->diaYhorario = $diaYhorario;

        return $this;
    }

    /**
     * @return Collection|Necesidad[]
     */
    public function getNecesidades(): Collection
    {
        return $this->necesidades;
    }

    public function addNecesidade(Necesidad $necesidade): self
    {
        if (!$this->necesidades->contains($necesidade)) {
            $this->necesidades[] = $necesidade;
            $necesidade->setComedor($this);
        }

        return $this;
    }

    public function removeNecesidade(Necesidad $necesidade): self
    {
        if ($this->necesidades->contains($necesidade)) {
            $this->necesidades->removeElement($necesidade);
            // set the owning side to null (unless already changed)
            if ($necesidade->getComedor() === $this) {
                $necesidade->setComedor(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|ComedorUsuario[]
     */
    public function getComedorUsuarios(): Collection
    {
        return $this->comedorUsuarios;
    }

    public function addComedorUsuario(ComedorUsuario $comedorUsuario): self
    {
        if (!$this->comedorUsuarios->contains($comedorUsuario)) {
            $this->comedorUsuarios[] = $comedorUsuario;
            $comedorUsuario->setComedor($this);
        }

        return $this;
    }

    public function removeComedorUsuario(ComedorUsuario $comedorUsuario): self
    {
        if ($this->comedorUsuarios->contains($comedorUsuario)) {
            $this->comedorUsuarios->removeElement($comedorUsuario);
            // set the owning side to null (unless already changed)
            if ($comedorUsuario->getComedor() === $this) {
                $comedorUsuario->setComedor(null);
            }
        }

        return $this;
    }
}
