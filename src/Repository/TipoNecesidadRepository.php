<?php

namespace App\Repository;

use App\Entity\TipoNecesidad;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method TipoNecesidad|null find($id, $lockMode = null, $lockVersion = null)
 * @method TipoNecesidad|null findOneBy(array $criteria, array $orderBy = null)
 * @method TipoNecesidad[]    findAll()
 * @method TipoNecesidad[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TipoNecesidadRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, TipoNecesidad::class);
    }

    // /**
    //  * @return TipoNecesidad[] Returns an array of TipoNecesidad objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('t')
            ->andWhere('t.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('t.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?TipoNecesidad
    {
        return $this->createQueryBuilder('t')
            ->andWhere('t.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
