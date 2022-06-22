CREATE TABLE `membertbl` (
  `memberID` char(8) NOT NULL,
  `memberName` char(5) NOT NULL,
  `memberAddress` char(20) DEFAULT NULL,
  PRIMARY KEY (`memberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT `membertbl`.`memberID`,
    `membertbl`.`memberName`,
    `membertbl`.`memberAddress`
FROM `shopdb`.`membertbl`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `uv_membertbl` AS select `membertbl`.`memberName` AS `memberName`,`membertbl`.`memberAddress` AS `memberAddress` from `membertbl`;
