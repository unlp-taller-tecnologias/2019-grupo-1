<?php

namespace App\Repository;

use App\Entity\RegistroAlimentacion;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method RegistroAlimentacion|null find($id, $lockMode = null, $lockVersion = null)
 * @method RegistroAlimentacion|null findOneBy(array $criteria, array $orderBy = null)
 * @method RegistroAlimentacion[]    findAll()
 * @method RegistroAlimentacion[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class RegistroAlimentacionRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, RegistroAlimentacion::class);
    }

    // /**
    //  * @return RegistroAlimentacion[] Returns an array of RegistroAlimentacion objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('r')
            ->andWhere('r.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('r.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?RegistroAlimentacion
    {
        return $this->createQueryBuilder('r')
            ->andWhere('r.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
