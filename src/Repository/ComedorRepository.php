<?php

namespace App\Repository;

use App\Entity\Comedor;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method Comedor|null find($id, $lockMode = null, $lockVersion = null)
 * @method Comedor|null findOneBy(array $criteria, array $orderBy = null)
 * @method Comedor[]    findAll()
 * @method Comedor[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ComedorRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Comedor::class);
    }

    // /**
    //  * @return Comedor[] Returns an array of Comedor objects
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
    public function findOneBySomeField($value): ?Comedor
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
