<?php

namespace App\Repository;

use App\Entity\Referente;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method Referente|null find($id, $lockMode = null, $lockVersion = null)
 * @method Referente|null findOneBy(array $criteria, array $orderBy = null)
 * @method Referente[]    findAll()
 * @method Referente[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ReferenteRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Referente::class);
    }

    // /**
    //  * @return Referente[] Returns an array of Referente objects
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
    public function findOneBySomeField($value): ?Referente
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
