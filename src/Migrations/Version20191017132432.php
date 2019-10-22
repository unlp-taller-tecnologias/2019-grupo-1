<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20191017132432 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE TABLE tipo_necesidad (id INT AUTO_INCREMENT NOT NULL, nombre VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('ALTER TABLE alimento CHANGE nombre nombre VARCHAR(255) NOT NULL');
        $this->addSql('ALTER TABLE comedor CHANGE organizacion organizacion VARCHAR(40) DEFAULT NULL, CHANGE telefono telefono VARCHAR(20) DEFAULT NULL, CHANGE foto foto VARCHAR(255) DEFAULT NULL, CHANGE red_social red_social VARCHAR(255) DEFAULT NULL, CHANGE mail_referente mail_referente VARCHAR(60) DEFAULT NULL, CHANGE estado estado VARCHAR(255) NOT NULL, CHANGE mapa mapa VARCHAR(255) NOT NULL');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('DROP TABLE tipo_necesidad');
        $this->addSql('ALTER TABLE alimento CHANGE nombre nombre TEXT NOT NULL COLLATE latin1_swedish_ci');
        $this->addSql('ALTER TABLE comedor CHANGE organizacion organizacion VARCHAR(40) DEFAULT \'NULL\' COLLATE utf8mb4_unicode_ci, CHANGE telefono telefono VARCHAR(20) DEFAULT \'NULL\' COLLATE utf8mb4_unicode_ci, CHANGE foto foto VARCHAR(255) DEFAULT \'NULL\' COLLATE utf8mb4_unicode_ci, CHANGE red_social red_social VARCHAR(255) DEFAULT \'NULL\' COLLATE utf8mb4_unicode_ci, CHANGE mail_referente mail_referente VARCHAR(60) DEFAULT \'NULL\' COLLATE utf8mb4_unicode_ci, CHANGE estado estado CHAR(2) NOT NULL COLLATE utf8mb4_unicode_ci, CHANGE mapa mapa TEXT NOT NULL COLLATE utf8mb4_unicode_ci');
    }
}
