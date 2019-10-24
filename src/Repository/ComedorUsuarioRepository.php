<?php

namespace App\Repository;

use App\Entity\ComedorUsuario;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method ComedorUsuario|null find($id, $lockMode = null, $lockVersion = null)
 * @method ComedorUsuario|null findOneBy(array $criteria, array $orderBy = null)
 * @method ComedorUsuario[]    findAll()
 * @method ComedorUsuario[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ComedorUsuarioRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ComedorUsuario::class);
    }

    // /**
    //  * @return ComedorUsuario[] Returns an array of ComedorUsuario objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('c.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?ComedorUsuario
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
