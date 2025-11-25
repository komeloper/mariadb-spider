CREATE TABLE IF NOT EXISTS `node_test01_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `created_user` varchar(255) NOT NULL,
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3) ON UPDATE current_timestamp(3),
  `updated_user` varchar(255) NOT NULL,
  `index01` int(11) NOT NULL DEFAULT 0,
  `value01` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`node_id`,`created_at`),
  KEY `idx01` (`index01`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
PARTITION BY RANGE COLUMNS(`created_at`)
(
    PARTITION `p20251201` VALUES LESS THAN ('2025-12-01'),
    PARTITION `p20251208` VALUES LESS THAN ('2025-12-08'),
    PARTITION `P20251215` VALUES LESS THAN ('2025-12-15'),
    PARTITION `pmax` VALUES LESS THAN (MAXVALUE) ENGINE=InnoDB
);

CREATE TABLE IF NOT EXISTS `node_test02_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `created_user` varchar(255) NOT NULL,
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3) ON UPDATE current_timestamp(3),
  `updated_user` varchar(255) NOT NULL,
  `index01` int(11) NOT NULL DEFAULT 0,
  `value01` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`node_id`,`created_at`),
  KEY `idx01` (`index01`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
PARTITION BY RANGE COLUMNS(`created_at`)
(
    PARTITION `p20251201` VALUES LESS THAN ('2025-12-01'),
    PARTITION `p20251208` VALUES LESS THAN ('2025-12-08'),
    PARTITION `P20251215` VALUES LESS THAN ('2025-12-15'),
    PARTITION `pmax` VALUES LESS THAN (MAXVALUE) ENGINE=InnoDB
);
