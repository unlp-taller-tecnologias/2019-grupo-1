<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\AlimentoXregRepository")
 */
class AlimentoXreg
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\registroalimentacion", inversedBy="alimentoXregs")
     * @ORM\JoinColumn(nullable=false)
     */
    private $registro;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\alimento", inversedBy="alimentoXregs")
     * @ORM\JoinColumn(nullable=false)
     */
    private $alimento;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getRegistro(): ?registroalimentacion
    {
        return $this->registro;
    }

    public function setRegistro(?registroalimentacion $registro): self
    {
        $this->registro = $registro;

        return $this;
    }

    public function getAlimento(): ?alimento
    {
        return $this->alimento;
    }

    public function setAlimento(?alimento $alimento): self
    {
        $this->alimento = $alimento;

        return $this;
    }
}
