<?php

namespace App\Controller;

use App\Form\ContactType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class ContactController extends AbstractController
{
    /**
     * @Route("/contact", name="contact")
     */
    public function index(Request $request, \Swift_Mailer $mailer)
    {
        $form = $this->createForm(ContactType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $contactFormData = $form->getData();

            $message = (new \Swift_Message('Message client'))
                ->setFrom($contactFormData['E-mail'])
                ->setTo('b.baptiste1991@gmail.com')
                ->setBody($contactFormData['Message'],'text/plain');

            $mailer->send($message);

            $this->addFlash('success', 'Message envoyé');

            return $this->redirectToRoute('contact');
        }

        return $this->render('emails/contact.html.twig', 
        [
            'email_form' => $form->createView(),
        ]);
    }
}