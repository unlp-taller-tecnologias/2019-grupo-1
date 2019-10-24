<?php

namespace App\Repository;

use App\Entity\AlimentoXreg;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method AlimentoXreg|null find($id, $lockMode = null, $lockVersion = null)
 * @method AlimentoXreg|null findOneBy(array $criteria, array $orderBy = null)
 * @method AlimentoXreg[]    findAll()
 * @method AlimentoXreg[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class AlimentoXregRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, AlimentoXreg::class);
    }

    // /**
    //  * @return AlimentoXreg[] Returns an array of AlimentoXreg objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('a')
            ->andWhere('a.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('a.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?AlimentoXreg
    {
        return $this->createQueryBuilder('a')
            ->andWhere('a.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
