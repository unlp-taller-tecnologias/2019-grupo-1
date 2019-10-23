<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Comedor;
use App\Entity\Alimento;
use App\Entity\TipoNecesidad;
use App\Form\AlimentoType;
use App\Form\TipoNecesidadType;

class StandarController extends AbstractController
{

/* CONTROLADORES DE ALTA, VERIFICACION Y LISTADO, USUARIOS/COMEDORES*/
    
     /**
     * @Route("/altaComedor", name="altaComedor")
     */
    public function altaComedor()
    { 
        $entityManager = $this ->getDoctrine() ->getManager();
        $comedor = new Comedor('prueba','prueba','prueba','prueba','prueba','prueba','prueba','prueba','prueba','prueba','prueba','prueba','prueba','prueba','prueba','prueba');
        
        $entityManager->persist($comedor);
        $entityManager->flush();
        
        return $this->render('standar/altaComedor.html.twig', ['controller_name' => "comedor",  ]);
    }

         /**
     * @Route("/altaUsuario", name="altaUsuario")
     */
    public function altaUsuario()
    { 
        $entityManager = $this ->getDoctrine() ->getManager();
        $comedor = new Comedor('prueba','prueba','prueba','prueba','prueba','prueba','prueba','prueba','prueba','prueba','prueba','prueba','prueba','prueba','prueba','prueba');
        
        $entityManager->persist($comedor);
        $entityManager->flush();
        
        return $this->render('standar/altaUsuario.html.twig');
    }



    /* CONTROLADORES DE LISTADO, ALTA Y BAJA DE TIPOS DE ALIMENTO/NECESIDAD*/

     /**
     * @Route("/tiposDeAlimentos", name="tiposDeAlimentos")
     */
    public function listadoAlimentos(Request $request)
    {
        $alimento= new Alimento();
        $form =  $this->createForm(AlimentoType::class, $alimento);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $alimento = $form->getData();

            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($alimento);
            $entityManager->flush();

            return $this->redirectToRoute('tiposDeAlimentos');
        }


        return $this->render('standar/tiposDeAlimentos.html.twig', ['form'=> $form->createView()]);
    }

     /**
     * @Route("/tiposDeNecesidades", name="tiposDeNecesidades")
     */
    public function listadoTipoNecesidades(Request $request)
    {
        $tipo_necesidad= new TipoNecesidad();
        $form =  $this->createForm(TipoNecesidadType::class, $tipo_necesidad);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $tipo_necesidad = $form->getData();

            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($tipo_necesidad);
            $entityManager->flush();

            return $this->redirectToRoute('tiposDeNecesidades');
        }


        return $this->render('standar/tiposDeNecesidad.html.twig', ['form'=> $form->createView()]);
    }

    /**
     * @Route("/listadoUsuariosPendientes", name="listadoUsuariosPendientes")
     */

    public function listadoUsuariosPendientes(Request $request)
    {
        return $this->render('standar/listadoUsuariosPendientes.html.twig');

    }

}