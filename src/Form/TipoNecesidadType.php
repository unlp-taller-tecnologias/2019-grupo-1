<?php

namespace App\Form;

use App\Entity\TipoNecesidad;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;

class TipoNecesidadType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('nombre', TextType::class, [ 'attr' => ['class' => 'form-control'] ])
            ->add('Cargar', SubmitType::class, [ 'attr' => ['class' => 'form-control "btn btn-primary px-3 '] ]);
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => TipoNecesidad::class,
        ]);
    }
}
