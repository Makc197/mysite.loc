-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.1.9-MariaDB - mariadb.org binary distribution
-- ОС Сервера:                   Win32
-- HeidiSQL Версия:              9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры базы данных mysite-local
CREATE DATABASE IF NOT EXISTS `mysite-local` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mysite-local`;


-- Дамп структуры для таблица mysite-local.auth_assignment
CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_assignment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы mysite-local.auth_assignment: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
REPLACE INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
	('Admin', 1, 1470396538),
	('managers', 2, 1470394976);
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;


-- Дамп структуры для таблица mysite-local.auth_item
CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `group_code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  KEY `fk_auth_item_group_code` (`group_code`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_auth_item_group_code` FOREIGN KEY (`group_code`) REFERENCES `auth_item_group` (`code`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы mysite-local.auth_item: ~192 rows (приблизительно)
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
REPLACE INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`, `group_code`) VALUES
	('/*', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('//*', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('//ajaxcrud', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('//controller', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('//crud', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('//extension', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('//form', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('//index', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('//model', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('//module', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/asset/*', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/asset/compress', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/asset/template', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/cache/*', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/cache/flush', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/cache/flush-all', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/cache/flush-schema', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/cache/index', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/debug/*', 3, NULL, NULL, NULL, 1470394618, 1470394618, NULL),
	('/debug/default/*', 3, NULL, NULL, NULL, 1470394618, 1470394618, NULL),
	('/debug/default/db-explain', 3, NULL, NULL, NULL, 1470394619, 1470394619, NULL),
	('/debug/default/download-mail', 3, NULL, NULL, NULL, 1470394618, 1470394618, NULL),
	('/debug/default/index', 3, NULL, NULL, NULL, 1470394619, 1470394619, NULL),
	('/debug/default/toolbar', 3, NULL, NULL, NULL, 1470394618, 1470394618, NULL),
	('/debug/default/view', 3, NULL, NULL, NULL, 1470394619, 1470394619, NULL),
	('/fixture/*', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/fixture/load', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/fixture/unload', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/gii/*', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/gii/default/*', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/gii/default/action', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/gii/default/diff', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/gii/default/index', 3, NULL, NULL, NULL, 1470393308, 1470393308, NULL),
	('/gii/default/preview', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/gii/default/view', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/gridview/*', 3, NULL, NULL, NULL, 1470394621, 1470394621, NULL),
	('/gridview/export/*', 3, NULL, NULL, NULL, 1470394621, 1470394621, NULL),
	('/gridview/export/download', 3, NULL, NULL, NULL, 1470394621, 1470394621, NULL),
	('/hello/*', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/hello/index', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/help/*', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/help/index', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/message/*', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/message/config', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/message/config-template', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/message/extract', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/migrate/*', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/migrate/create', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/migrate/down', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/migrate/history', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/migrate/mark', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/migrate/new', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/migrate/redo', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/migrate/to', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/migrate/up', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/serve/*', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/serve/index', 3, NULL, NULL, NULL, 1470393307, 1470393307, NULL),
	('/shop/*', 3, NULL, NULL, NULL, 1470394621, 1470394621, NULL),
	('/shop/base/*', 3, NULL, NULL, NULL, 1470394622, 1470394622, NULL),
	('/shop/book/*', 3, NULL, NULL, NULL, 1470394622, 1470394622, NULL),
	('/shop/book/bulk-delete', 3, NULL, NULL, NULL, 1470394622, 1470394622, NULL),
	('/shop/book/create', 3, NULL, NULL, NULL, 1470394622, 1470394622, NULL),
	('/shop/book/delete', 3, NULL, NULL, NULL, 1470394622, 1470394622, NULL),
	('/shop/book/index', 3, NULL, NULL, NULL, 1470394622, 1470394622, NULL),
	('/shop/book/update', 3, NULL, NULL, NULL, 1470394622, 1470394622, NULL),
	('/shop/book/view', 3, NULL, NULL, NULL, 1470394622, 1470394622, NULL),
	('/shop/cd/*', 3, NULL, NULL, NULL, 1470394622, 1470394622, NULL),
	('/shop/cd/bulk-delete', 3, NULL, NULL, NULL, 1470394622, 1470394622, NULL),
	('/shop/cd/create', 3, NULL, NULL, NULL, 1470394622, 1470394622, NULL),
	('/shop/cd/delete', 3, NULL, NULL, NULL, 1470394622, 1470394622, NULL),
	('/shop/cd/index', 3, NULL, NULL, NULL, 1470394622, 1470394622, NULL),
	('/shop/cd/update', 3, NULL, NULL, NULL, 1470394622, 1470394622, NULL),
	('/shop/cd/view', 3, NULL, NULL, NULL, 1470394622, 1470394622, NULL),
	('/shop/default/*', 3, NULL, NULL, NULL, 1470394621, 1470394621, NULL),
	('/shop/default/index', 3, NULL, NULL, NULL, 1470394621, 1470394621, NULL),
	('/shop/product/*', 3, NULL, NULL, NULL, 1470394621, 1470394621, NULL),
	('/shop/product/bulk-delete', 3, NULL, NULL, NULL, 1470394621, 1470394621, NULL),
	('/shop/product/create', 3, NULL, NULL, NULL, 1470394621, 1470394621, NULL),
	('/shop/product/delete', 3, NULL, NULL, NULL, 1470394621, 1470394621, NULL),
	('/shop/product/index', 3, NULL, NULL, NULL, 1470394621, 1470394621, NULL),
	('/shop/product/update', 3, NULL, NULL, NULL, 1470394621, 1470394621, NULL),
	('/shop/product/view', 3, NULL, NULL, NULL, 1470394621, 1470394621, NULL),
	('/site/*', 3, NULL, NULL, NULL, 1470394618, 1470394618, NULL),
	('/site/about', 3, NULL, NULL, NULL, 1470394618, 1470394618, NULL),
	('/site/captcha', 3, NULL, NULL, NULL, 1470394618, 1470394618, NULL),
	('/site/comments', 3, NULL, NULL, NULL, 1470394618, 1470394618, NULL),
	('/site/contact', 3, NULL, NULL, NULL, 1470394618, 1470394618, NULL),
	('/site/error', 3, NULL, NULL, NULL, 1470394618, 1470394618, NULL),
	('/site/form', 3, NULL, NULL, NULL, 1470394618, 1470394618, NULL),
	('/site/hello', 3, NULL, NULL, NULL, 1470394618, 1470394618, NULL),
	('/site/index', 3, NULL, NULL, NULL, 1470394618, 1470394618, NULL),
	('/site/login', 3, NULL, NULL, NULL, 1470394618, 1470394618, NULL),
	('/site/logout', 3, NULL, NULL, NULL, 1470394618, 1470394618, NULL),
	('/site/user', 3, NULL, NULL, NULL, 1470394618, 1470394618, NULL),
	('/user-management/*', 3, NULL, NULL, NULL, 1470393308, 1470393308, NULL),
	('/user-management/auth-item-group/*', 3, NULL, NULL, NULL, 1470394620, 1470394620, NULL),
	('/user-management/auth-item-group/bulk-activate', 3, NULL, NULL, NULL, 1470394621, 1470394621, NULL),
	('/user-management/auth-item-group/bulk-deactivate', 3, NULL, NULL, NULL, 1470394621, 1470394621, NULL),
	('/user-management/auth-item-group/bulk-delete', 3, NULL, NULL, NULL, 1470394621, 1470394621, NULL),
	('/user-management/auth-item-group/create', 3, NULL, NULL, NULL, 1470394621, 1470394621, NULL),
	('/user-management/auth-item-group/delete', 3, NULL, NULL, NULL, 1470394621, 1470394621, NULL),
	('/user-management/auth-item-group/grid-page-size', 3, NULL, NULL, NULL, 1470394620, 1470394620, NULL),
	('/user-management/auth-item-group/grid-sort', 3, NULL, NULL, NULL, 1470394621, 1470394621, NULL),
	('/user-management/auth-item-group/index', 3, NULL, NULL, NULL, 1470394621, 1470394621, NULL),
	('/user-management/auth-item-group/toggle-attribute', 3, NULL, NULL, NULL, 1470394621, 1470394621, NULL),
	('/user-management/auth-item-group/update', 3, NULL, NULL, NULL, 1470394621, 1470394621, NULL),
	('/user-management/auth-item-group/view', 3, NULL, NULL, NULL, 1470394621, 1470394621, NULL),
	('/user-management/auth/*', 3, NULL, NULL, NULL, 1470394621, 1470394621, NULL),
	('/user-management/auth/captcha', 3, NULL, NULL, NULL, 1470394621, 1470394621, NULL),
	('/user-management/auth/change-own-password', 3, NULL, NULL, NULL, 1470393309, 1470393309, NULL),
	('/user-management/auth/confirm-email', 3, NULL, NULL, NULL, 1470394621, 1470394621, NULL),
	('/user-management/auth/confirm-email-receive', 3, NULL, NULL, NULL, 1470394621, 1470394621, NULL),
	('/user-management/auth/confirm-registration-email', 3, NULL, NULL, NULL, 1470394621, 1470394621, NULL),
	('/user-management/auth/login', 3, NULL, NULL, NULL, 1470394621, 1470394621, NULL),
	('/user-management/auth/logout', 3, NULL, NULL, NULL, 1470394621, 1470394621, NULL),
	('/user-management/auth/password-recovery', 3, NULL, NULL, NULL, 1470394621, 1470394621, NULL),
	('/user-management/auth/password-recovery-receive', 3, NULL, NULL, NULL, 1470394621, 1470394621, NULL),
	('/user-management/auth/registration', 3, NULL, NULL, NULL, 1470394621, 1470394621, NULL),
	('/user-management/permission/*', 3, NULL, NULL, NULL, 1470394620, 1470394620, NULL),
	('/user-management/permission/bulk-activate', 3, NULL, NULL, NULL, 1470394620, 1470394620, NULL),
	('/user-management/permission/bulk-deactivate', 3, NULL, NULL, NULL, 1470394620, 1470394620, NULL),
	('/user-management/permission/bulk-delete', 3, NULL, NULL, NULL, 1470394620, 1470394620, NULL),
	('/user-management/permission/create', 3, NULL, NULL, NULL, 1470394620, 1470394620, NULL),
	('/user-management/permission/delete', 3, NULL, NULL, NULL, 1470394620, 1470394620, NULL),
	('/user-management/permission/grid-page-size', 3, NULL, NULL, NULL, 1470394620, 1470394620, NULL),
	('/user-management/permission/grid-sort', 3, NULL, NULL, NULL, 1470394620, 1470394620, NULL),
	('/user-management/permission/index', 3, NULL, NULL, NULL, 1470394620, 1470394620, NULL),
	('/user-management/permission/refresh-routes', 3, NULL, NULL, NULL, 1470394620, 1470394620, NULL),
	('/user-management/permission/set-child-permissions', 3, NULL, NULL, NULL, 1470394620, 1470394620, NULL),
	('/user-management/permission/set-child-routes', 3, NULL, NULL, NULL, 1470394620, 1470394620, NULL),
	('/user-management/permission/toggle-attribute', 3, NULL, NULL, NULL, 1470394620, 1470394620, NULL),
	('/user-management/permission/update', 3, NULL, NULL, NULL, 1470394620, 1470394620, NULL),
	('/user-management/permission/view', 3, NULL, NULL, NULL, 1470394620, 1470394620, NULL),
	('/user-management/role/*', 3, NULL, NULL, NULL, 1470394619, 1470394619, NULL),
	('/user-management/role/bulk-activate', 3, NULL, NULL, NULL, 1470394620, 1470394620, NULL),
	('/user-management/role/bulk-deactivate', 3, NULL, NULL, NULL, 1470394620, 1470394620, NULL),
	('/user-management/role/bulk-delete', 3, NULL, NULL, NULL, 1470394619, 1470394619, NULL),
	('/user-management/role/create', 3, NULL, NULL, NULL, 1470394620, 1470394620, NULL),
	('/user-management/role/delete', 3, NULL, NULL, NULL, 1470394620, 1470394620, NULL),
	('/user-management/role/grid-page-size', 3, NULL, NULL, NULL, 1470394619, 1470394619, NULL),
	('/user-management/role/grid-sort', 3, NULL, NULL, NULL, 1470394619, 1470394619, NULL),
	('/user-management/role/index', 3, NULL, NULL, NULL, 1470394620, 1470394620, NULL),
	('/user-management/role/set-child-permissions', 3, NULL, NULL, NULL, 1470394620, 1470394620, NULL),
	('/user-management/role/set-child-roles', 3, NULL, NULL, NULL, 1470394620, 1470394620, NULL),
	('/user-management/role/toggle-attribute', 3, NULL, NULL, NULL, 1470394620, 1470394620, NULL),
	('/user-management/role/update', 3, NULL, NULL, NULL, 1470394620, 1470394620, NULL),
	('/user-management/role/view', 3, NULL, NULL, NULL, 1470394620, 1470394620, NULL),
	('/user-management/user-permission/*', 3, NULL, NULL, NULL, 1470394619, 1470394619, NULL),
	('/user-management/user-permission/set', 3, NULL, NULL, NULL, 1470393308, 1470393308, NULL),
	('/user-management/user-permission/set-roles', 3, NULL, NULL, NULL, 1470393308, 1470393308, NULL),
	('/user-management/user-visit-log/*', 3, NULL, NULL, NULL, 1470394619, 1470394619, NULL),
	('/user-management/user-visit-log/bulk-activate', 3, NULL, NULL, NULL, 1470394619, 1470394619, NULL),
	('/user-management/user-visit-log/bulk-deactivate', 3, NULL, NULL, NULL, 1470394619, 1470394619, NULL),
	('/user-management/user-visit-log/bulk-delete', 3, NULL, NULL, NULL, 1470394619, 1470394619, NULL),
	('/user-management/user-visit-log/create', 3, NULL, NULL, NULL, 1470394619, 1470394619, NULL),
	('/user-management/user-visit-log/delete', 3, NULL, NULL, NULL, 1470394619, 1470394619, NULL),
	('/user-management/user-visit-log/grid-page-size', 3, NULL, NULL, NULL, 1470394619, 1470394619, NULL),
	('/user-management/user-visit-log/grid-sort', 3, NULL, NULL, NULL, 1470394619, 1470394619, NULL),
	('/user-management/user-visit-log/index', 3, NULL, NULL, NULL, 1470394619, 1470394619, NULL),
	('/user-management/user-visit-log/toggle-attribute', 3, NULL, NULL, NULL, 1470394619, 1470394619, NULL),
	('/user-management/user-visit-log/update', 3, NULL, NULL, NULL, 1470394619, 1470394619, NULL),
	('/user-management/user-visit-log/view', 3, NULL, NULL, NULL, 1470394619, 1470394619, NULL),
	('/user-management/user/*', 3, NULL, NULL, NULL, 1470394619, 1470394619, NULL),
	('/user-management/user/bulk-activate', 3, NULL, NULL, NULL, 1470393308, 1470393308, NULL),
	('/user-management/user/bulk-deactivate', 3, NULL, NULL, NULL, 1470393308, 1470393308, NULL),
	('/user-management/user/bulk-delete', 3, NULL, NULL, NULL, 1470393308, 1470393308, NULL),
	('/user-management/user/change-password', 3, NULL, NULL, NULL, 1470393308, 1470393308, NULL),
	('/user-management/user/create', 3, NULL, NULL, NULL, 1470393308, 1470393308, NULL),
	('/user-management/user/delete', 3, NULL, NULL, NULL, 1470393308, 1470393308, NULL),
	('/user-management/user/grid-page-size', 3, NULL, NULL, NULL, 1470393308, 1470393308, NULL),
	('/user-management/user/grid-sort', 3, NULL, NULL, NULL, 1470394619, 1470394619, NULL),
	('/user-management/user/index', 3, NULL, NULL, NULL, 1470393308, 1470393308, NULL),
	('/user-management/user/toggle-attribute', 3, NULL, NULL, NULL, 1470394619, 1470394619, NULL),
	('/user-management/user/update', 3, NULL, NULL, NULL, 1470393308, 1470393308, NULL),
	('/user-management/user/view', 3, NULL, NULL, NULL, 1470393308, 1470393308, NULL),
	('Admin', 1, 'Admin', NULL, NULL, 1470393308, 1470393308, NULL),
	('assignRolesToUsers', 2, 'Assign roles to users', NULL, NULL, 1470393308, 1470393308, 'userManagement'),
	('bindUserToIp', 2, 'Bind user to IP', NULL, NULL, 1470393308, 1470393308, 'userManagement'),
	('changeOwnPassword', 2, 'Change own password', NULL, NULL, 1470393308, 1470393308, 'userCommonPermissions'),
	('changeUserPassword', 2, 'Change user password', NULL, NULL, 1470393308, 1470393308, 'userManagement'),
	('commonPermission', 2, 'Common permission', NULL, NULL, 1470393302, 1470393302, NULL),
	('createUsers', 2, 'Create users', NULL, NULL, 1470393308, 1470393308, 'userManagement'),
	('deleteUsers', 2, 'Delete users', NULL, NULL, 1470393308, 1470393308, 'userManagement'),
	('editUserEmail', 2, 'Edit user email', NULL, NULL, 1470393308, 1470393308, 'userManagement'),
	('editUsers', 2, 'Edit users', NULL, NULL, 1470393308, 1470393308, 'userManagement'),
	('managers', 1, 'Managers', NULL, NULL, 1470393747, 1470393747, NULL),
	('shop-module', 2, 'Просмотр продуктов', NULL, NULL, 1470393848, 1470394804, 'shop-model'),
	('viewRegistrationIp', 2, 'View registration IP', NULL, NULL, 1470393308, 1470393308, 'userManagement'),
	('viewUserEmail', 2, 'View user email', NULL, NULL, 1470393308, 1470393308, 'userManagement'),
	('viewUserRoles', 2, 'View user roles', NULL, NULL, 1470393308, 1470393308, 'userManagement'),
	('viewUsers', 2, 'View users', NULL, NULL, 1470393308, 1470393308, 'userManagement'),
	('viewVisitLog', 2, 'View visit log', NULL, NULL, 1470393308, 1470393308, 'userManagement');
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;


-- Дамп структуры для таблица mysite-local.auth_item_child
CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы mysite-local.auth_item_child: ~34 rows (приблизительно)
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
REPLACE INTO `auth_item_child` (`parent`, `child`) VALUES
	('Admin', 'assignRolesToUsers'),
	('Admin', 'changeOwnPassword'),
	('Admin', 'changeUserPassword'),
	('Admin', 'createUsers'),
	('Admin', 'deleteUsers'),
	('Admin', 'editUsers'),
	('Admin', 'viewUsers'),
	('assignRolesToUsers', '/user-management/user-permission/set'),
	('assignRolesToUsers', '/user-management/user-permission/set-roles'),
	('assignRolesToUsers', 'viewUserRoles'),
	('assignRolesToUsers', 'viewUsers'),
	('changeOwnPassword', '/user-management/auth/change-own-password'),
	('changeUserPassword', '/user-management/user/change-password'),
	('changeUserPassword', 'viewUsers'),
	('createUsers', '/user-management/user/create'),
	('createUsers', 'viewUsers'),
	('deleteUsers', '/user-management/user/bulk-delete'),
	('deleteUsers', '/user-management/user/delete'),
	('deleteUsers', 'viewUsers'),
	('editUserEmail', 'viewUserEmail'),
	('editUsers', '/user-management/user/bulk-activate'),
	('editUsers', '/user-management/user/bulk-deactivate'),
	('editUsers', '/user-management/user/update'),
	('editUsers', 'viewUsers'),
	('managers', 'shop-module'),
	('shop-module', '/shop/book/index'),
	('shop-module', '/shop/book/view'),
	('shop-module', '/shop/cd/index'),
	('shop-module', '/shop/cd/view'),
	('shop-module', '/shop/product/index'),
	('shop-module', '/shop/product/view'),
	('viewUsers', '/user-management/user/grid-page-size'),
	('viewUsers', '/user-management/user/index'),
	('viewUsers', '/user-management/user/view');
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;


-- Дамп структуры для таблица mysite-local.auth_item_group
CREATE TABLE IF NOT EXISTS `auth_item_group` (
  `code` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы mysite-local.auth_item_group: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `auth_item_group` DISABLE KEYS */;
REPLACE INTO `auth_item_group` (`code`, `name`, `created_at`, `updated_at`) VALUES
	('shop-model', 'Модуль магазин', 1470393820, 1470394754),
	('userCommonPermissions', 'User common permission', 1470393308, 1470393308),
	('userManagement', 'User management', 1470393308, 1470393308);
/*!40000 ALTER TABLE `auth_item_group` ENABLE KEYS */;


-- Дамп структуры для таблица mysite-local.auth_rule
CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы mysite-local.auth_rule: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;


-- Дамп структуры для таблица mysite-local.books
CREATE TABLE IF NOT EXISTS `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL DEFAULT 'book',
  `title` varchar(500) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `price` double NOT NULL,
  `author` varchar(200) NOT NULL,
  `numpages` decimal(30,0) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы mysite-local.books: ~15 rows (приблизительно)
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
REPLACE INTO `books` (`id`, `type`, `title`, `description`, `price`, `author`, `numpages`) VALUES
	(2, 'book', 'Книга №2', 'Описание книги №2', 123210032433, 'Автор книги №2', 222),
	(3, 'book', 'Книга №2', 'Описание книги №2', 123210032433, 'Автор книги №2', 222),
	(4, 'book', 'Книга №2', 'Описание книги №2', 123210032433, 'Автор книги №2', 222),
	(5, 'book', 'Книга №2', 'Описание книги №2', 123210032433, 'Автор книги №2', 222),
	(6, 'book', 'Книга №2', 'Описание книги №2', 123210032433, 'Автор книги №2', 222),
	(7, 'book', 'Книга №2', 'Описание книги №2', 123210032433, 'Автор книги №2', 222),
	(8, 'book', 'Книга №2', 'Описание книги №2', 123210032433, 'Автор книги №2', 222),
	(9, 'book', 'Книга №2', 'Описание книги №2', 123210032433, 'Автор книги №2', 222),
	(10, 'book', 'Книга №2', 'Описание книги №2', 123210032433, 'Автор книги №2', 222),
	(11, 'book', 'Книга №2', 'Описание книги №2', 123210032433, 'Автор книги №2', 222),
	(12, 'book', 'Книга №2', 'Описание книги №2', 123210032433, 'Автор книги №2', 222),
	(13, 'book', 'Книга №2', 'Описание книги №2', 123210032433, 'Автор книги №2', 222),
	(14, 'book', 'Книга №2', 'Описание книги №2', 123210032433, 'Автор книги №2', 222),
	(15, 'book', 'Книга №2', 'Описание книги №2', 123210032433, 'Автор книги №2', 222),
	(16, 'book', 'Книга №2', 'Описание книги №2', 123210032433, 'Автор книги №2', 222);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;


-- Дамп структуры для таблица mysite-local.cds
CREATE TABLE IF NOT EXISTS `cds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL DEFAULT 'cd',
  `title` varchar(500) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `price` double NOT NULL,
  `author` varchar(200) NOT NULL,
  `playlenght` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы mysite-local.cds: ~22 rows (приблизительно)
/*!40000 ALTER TABLE `cds` DISABLE KEYS */;
REPLACE INTO `cds` (`id`, `type`, `title`, `description`, `price`, `author`, `playlenght`) VALUES
	(3, 'cd', 'тест', '123123sdgds', 12213, '123123', 0),
	(4, 'cd', 'CD №1', 'Описание CD1', 3155, 'Автор CD1', 0),
	(5, 'cd', 'CD №1', 'Описание CD1', 3155, 'Автор CD1', 0),
	(6, 'cd', 'CD №1', 'Описание CD1', 3155, 'Автор CD1', 0),
	(7, 'cd', 'CD №1', 'Описание CD1', 3155, 'Автор CD1', 0),
	(8, 'cd', 'CD №1', 'Описание CD1', 3155, 'Автор CD1', 0),
	(9, 'cd', 'CD №1', 'Описание CD1', 3155, 'Автор CD1', 0),
	(10, 'cd', 'CD №1', 'Описание CD1', 3155, 'Автор CD1', 0),
	(11, 'cd', 'CD №1', 'Описание CD1', 3155, 'Автор CD1', 0),
	(12, 'cd', 'CD №1', 'Описание CD1', 3155, 'Автор CD1', 0),
	(13, 'cd', 'CD №1', 'Описание CD1', 3155, 'Автор CD1', 0),
	(14, 'cd', 'CD №1', 'Описание CD1', 3155, 'Автор CD1', 0),
	(15, 'cd', 'CD №1', 'Описание CD1', 3155, 'Автор CD1', 0),
	(16, 'cd', 'CD №1', 'Описание CD1', 3155, 'Автор CD1', 0),
	(17, 'cd', 'CD №1', 'Описание CD1', 3155, 'Автор CD1', 0),
	(18, 'cd', 'CD №1', 'Описание CD1', 3155, 'Автор CD1', 0),
	(19, 'cd', 'CD №1', 'Описание CD1', 3155, 'Автор CD1', 0),
	(20, 'cd', 'CD №1', 'Описание CD1', 3155, 'Автор CD1', 0),
	(21, 'cd', 'CD №1', 'Описание CD1', 3155, 'Автор CD1', 0),
	(22, 'cd', 'CD №1', 'Описание CD1', 3155, 'Автор CD1', 0),
	(23, 'cd', 'CD №1', 'Описание CD1', 3155, 'Автор CD1', 0),
	(24, 'cd', 'CD №1', 'Описание CD1', 3155, 'Автор CD1', 0);
/*!40000 ALTER TABLE `cds` ENABLE KEYS */;


-- Дамп структуры для таблица mysite-local.comments
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы mysite-local.comments: 5 rows
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
REPLACE INTO `comments` (`id`, `name`, `text`) VALUES
	(1, 'Макс', 'Комментарий 1'),
	(2, 'Надя', 'Комментарий 2'),
	(3, 'Вероника', 'Комментарий 3'),
	(4, 'Вика', 'Комментарий 4'),
	(5, 'Сергей', 'Комментарий 5');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;


-- Дамп структуры для таблица mysite-local.migration
CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы mysite-local.migration: ~10 rows (приблизительно)
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
REPLACE INTO `migration` (`version`, `apply_time`) VALUES
	('m000000_000000_base', 1470393289),
	('m140608_173539_create_user_table', 1470393296),
	('m140611_133903_init_rbac', 1470393299),
	('m140808_073114_create_auth_item_group_table', 1470393301),
	('m140809_072112_insert_superadmin_to_user', 1470393302),
	('m140809_073114_insert_common_permisison_to_auth_item', 1470393303),
	('m141023_141535_create_user_visit_log', 1470393303),
	('m141116_115804_add_bind_to_ip_and_registration_ip_to_user', 1470393304),
	('m141121_194858_split_browser_and_os_column', 1470393306),
	('m141201_220516_add_email_and_email_confirmed_to_user', 1470393307),
	('m141207_001649_create_basic_user_permissions', 1470393309);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;


-- Дамп структуры для таблица mysite-local.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL DEFAULT 'product',
  `title` varchar(500) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы mysite-local.products: ~53 rows (приблизительно)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
REPLACE INTO `products` (`id`, `type`, `title`, `description`, `price`) VALUES
	(1, 'product', 'Товар №1', 'Описание товара №1', 114545000),
	(4, 'product', '123123', '123123123123123', 123),
	(6, 'product', '123123', '123123123123123', 123),
	(28, 'product', '123123', '123123123123123', 123),
	(29, 'product', '123123', '123123123123123', 123),
	(30, 'product', '123123', '123123123123123', 123),
	(31, 'product', '123123', '123123123123123', 123),
	(32, 'product', '123123', '123123123123123', 123),
	(33, 'product', '123123', '123123123123123', 123),
	(34, 'product', '123123', '123123123123123', 123),
	(35, 'product', '123123', '123123123123123', 123),
	(36, 'product', '123123', '123123123123123', 123),
	(37, 'product', '123123', '123123123123123', 123),
	(38, 'product', '123123', '123123123123123', 123),
	(39, 'product', '123123', '123123123123123', 123),
	(40, 'product', '123123', '123123123123123', 123),
	(41, 'product', '123123', '123123123123123', 123),
	(42, 'product', '123123', '123123123123123', 123),
	(43, 'product', '123123', '123123123123123', 123),
	(44, 'product', '123123', '123123123123123', 123),
	(45, 'product', '123123', '123123123123123', 123),
	(46, 'product', '123123', '123123123123123', 123),
	(47, 'product', '123123', '123123123123123', 123),
	(48, 'product', '123123', '123123123123123', 123),
	(49, 'product', '123123', '123123123123123', 123),
	(50, 'product', '123123', '123123123123123', 123),
	(51, 'product', '123123', '123123123123123', 123),
	(52, 'product', '123123', '123123123123123', 123),
	(53, 'product', '123123', '123123123123123', 123),
	(54, 'product', '123123', '123123123123123', 123),
	(55, 'product', '123123', '123123123123123', 123),
	(56, 'product', '123123', '123123123123123', 123),
	(57, 'product', '123123', '123123123123123', 123),
	(58, 'product', '123123', '123123123123123', 123),
	(59, 'product', '123123', '123123123123123', 123),
	(60, 'product', '123123', '123123123123123', 123),
	(61, 'product', '123123', '123123123123123', 123),
	(62, 'product', '123123', '123123123123123', 123),
	(63, 'product', '123123', '123123123123123', 123),
	(64, 'product', '123123', '123123123123123', 123),
	(65, 'product', '123123', '123123123123123', 123),
	(66, 'product', '123123', '123123123123123', 123),
	(67, 'product', '123123', '123123123123123', 123),
	(68, 'product', '123123', '123123123123123', 123),
	(69, 'product', '123123', '123123123123123', 123),
	(70, 'product', '123123', '123123123123123', 123),
	(71, 'product', '123123', '123123123123123', 123),
	(72, 'product', '123123', '123123123123123', 123),
	(73, 'product', '123123', '123123123123123', 123),
	(74, 'product', '123123', '123123123123123', 123);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;


-- Дамп структуры для таблица mysite-local.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `superadmin` smallint(6) DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `registration_ip` varchar(15) DEFAULT NULL,
  `bind_to_ip` varchar(255) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `email_confirmed` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы mysite-local.user: ~1 rows (приблизительно)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
REPLACE INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `confirmation_token`, `status`, `superadmin`, `created_at`, `updated_at`, `registration_ip`, `bind_to_ip`, `email`, `email_confirmed`) VALUES
	(1, 'superadmin', 'x3m5qFqg9WSdgkhGFwABH8ZDvKI8hoYq', '$2y$13$ED5f9R0w4WPVZ0ArCP.LT.GFPtX5V7wEVgJrVUUBUCLTtcNhV5Aca', NULL, 1, 1, 1470393302, 1470393302, NULL, NULL, NULL, 0),
	(2, 'user', 'RM-qLhsxcWgBXrJdaMF5aOmyHWh2ZYL2', '$2y$13$NjU63BIeSXSBGTTisDNjjubl.20chQWPhjHeoPO/juz2nNV/ZdsCK', NULL, -1, 0, 1470393708, 1475846924, '127.0.0.1', '', 'user@user.ru', 1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- Дамп структуры для таблица mysite-local.user_visit_log
CREATE TABLE IF NOT EXISTS `user_visit_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `language` char(2) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `visit_time` int(11) NOT NULL,
  `browser` varchar(30) DEFAULT NULL,
  `os` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_visit_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы mysite-local.user_visit_log: ~39 rows (приблизительно)
/*!40000 ALTER TABLE `user_visit_log` DISABLE KEYS */;
REPLACE INTO `user_visit_log` (`id`, `token`, `ip`, `language`, `user_agent`, `user_id`, `visit_time`, `browser`, `os`) VALUES
	(1, '57a46c8ae2110', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 1, 1470393482, 'Chrome', 'Windows'),
	(2, '57a46e8d04bad', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 2, 1470393997, 'Chrome', 'Windows'),
	(3, '57a46ebf96f1b', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 1, 1470394047, 'Chrome', 'Windows'),
	(4, '57a4702dd0cae', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 2, 1470394413, 'Chrome', 'Windows'),
	(5, '57a47099db172', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 1, 1470394521, 'Chrome', 'Windows'),
	(6, '57a471f9c94cb', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 2, 1470394873, 'Chrome', 'Windows'),
	(7, '57a47220cc0aa', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 1, 1470394912, 'Chrome', 'Windows'),
	(8, '57a4726c3e074', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 2, 1470394988, 'Chrome', 'Windows'),
	(9, '57a4729433999', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 1, 1470395028, 'Chrome', 'Windows'),
	(10, '57a472d411946', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 2, 1470395092, 'Chrome', 'Windows'),
	(11, '57a474204323f', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 2, 1470395424, 'Chrome', 'Windows'),
	(12, '57a4742f3dfa8', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 2, 1470395439, 'Chrome', 'Windows'),
	(13, '57a4744578e20', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 2, 1470395461, 'Chrome', 'Windows'),
	(14, '57a474cbaf3f5', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 2, 1470395595, 'Chrome', 'Windows'),
	(15, '57a4751977345', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 1, 1470395673, 'Chrome', 'Windows'),
	(16, '57a478cce0f6b', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 1, 1470396620, 'Chrome', 'Windows'),
	(17, '57a47d2089e45', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 2, 1470397728, 'Chrome', 'Windows'),
	(18, '57a47d3a2720d', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 1, 1470397754, 'Chrome', 'Windows'),
	(19, '57a47e40b056e', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 2, 1470398016, 'Chrome', 'Windows'),
	(20, '57a47e5d2072f', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 1, 1470398045, 'Chrome', 'Windows'),
	(21, '57a47ede3c218', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 2, 1470398174, 'Chrome', 'Windows'),
	(22, '57a47ef7b8443', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 2, 1470398199, 'Chrome', 'Windows'),
	(23, '57a47f104f629', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 1, 1470398224, 'Chrome', 'Windows'),
	(24, '57a47f6f3fdd7', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 1, 1470398319, 'Chrome', 'Windows'),
	(25, '57a486fda6ce1', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 2, 1470400253, 'Chrome', 'Windows'),
	(26, '57a48af85c683', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 2, 1470401272, 'Chrome', 'Windows'),
	(27, '57a48b0c40da5', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 1, 1470401292, 'Chrome', 'Windows'),
	(28, '57a4a922b3fa9', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 1, 1470408994, 'Chrome', 'Windows'),
	(29, '57f659272b4f3', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1, 1475762471, 'Chrome', 'Windows'),
	(30, '57f66c7ea7625', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 2, 1475767422, 'Chrome', 'Windows'),
	(31, '57f677fcd35ce', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1, 1475770364, 'Chrome', 'Windows'),
	(32, '57f6786443173', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1, 1475770468, 'Chrome', 'Windows'),
	(33, '57f67a6fc3227', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1, 1475770991, 'Chrome', 'Windows'),
	(34, '57f7979821ab7', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1, 1475843992, 'Chrome', 'Windows'),
	(35, '57f79f8a6119d', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 2, 1475846026, 'Chrome', 'Windows'),
	(36, '57f7a262400d5', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1, 1475846754, 'Chrome', 'Windows'),
	(37, '57f7a328e1460', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1, 1475846952, 'Chrome', 'Windows'),
	(38, '57f7a69e3ddae', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1, 1475847838, 'Chrome', 'Windows'),
	(39, '57f7acdee43ff', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1, 1475849438, 'Chrome', 'Windows'),
	(40, '57fb8cb7cc60c', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1, 1476103351, 'Chrome', 'Windows'),
	(41, '57fd17e3a8af1', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1, 1476204515, 'Chrome', 'Windows'),
	(42, '5810997203f13', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 1, 1477482866, 'Chrome', 'Windows'),
	(43, '581359f7996d3', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36', 1, 1477663223, 'Chrome', 'Windows'),
	(44, '58382e20658d9', '127.0.0.1', 'ru', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', 1, 1480076832, 'Chrome', 'Windows');
/*!40000 ALTER TABLE `user_visit_log` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
