<?php

namespace App\Form;

use App\Entity\Comedor;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ComedorType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('nombreDeUsuario')
            ->add('nombreDeComedor')
            ->add('contrasenia')
            ->add('organizacion')
            ->add('descripcion')
            ->add('telefono')
            ->add('direccion')
            ->add('foto')
            ->add('redSocial')
            ->add('nombreReferente')
            ->add('apellidoReferente')
            ->add('mailReferente')
            ->add('telefonoReferente')
            ->add('diasYHorarios')
            ->add('estado')
            ->add('mapa')
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Comedor::class,
        ]);
    }
}
