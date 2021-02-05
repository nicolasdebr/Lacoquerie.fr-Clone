<?php

namespace App\Form;

use App\Entity\Commentaire;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class CommentaireFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            // ->add('date')
            ->add('rate', TextType::class, [
                'attr' => [
                    'class' => 'form-control rating-input',
                    'title' => '',
                ]
            ])
            ->add('description', TextareaType::class, [
                'attr' => [
                    'class' => 'form-control',
                    'placeholder' => 'Ajoutez votre propre commentaire !',
                    'rows' => '5',
                    'cols' => '70',
                ]
            ])
            // ->add('image')
            // ->add('produit')
            ->add('Envoyer', SubmitType::class, [
                'attr' => [
                    'class' => 'btn btn-default',
                ]
            ])
        ;
    }
    
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Commentaire::class,
        ]);
    }
}
