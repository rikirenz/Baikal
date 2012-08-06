#
# This is the empty database schema for Baïkal
# Corresponds to the MySQL Schema definition of project SabreDAV 1.6.4
# http://code.google.com/p/sabredav/
#

CREATE TABLE users (
	id INTEGER UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(50),
	digesta1 VARCHAR(32),
	UNIQUE(username)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE principals (
	id INTEGER UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	uri VARCHAR(200) NOT NULL,
	email VARCHAR(80),
	displayname VARCHAR(80),
	vcardurl VARCHAR(80),
	UNIQUE(uri)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE groupmembers (
	id INTEGER UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	principal_id INTEGER UNSIGNED NOT NULL,
	member_id INTEGER UNSIGNED NOT NULL,
	UNIQUE(principal_id, member_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE locks (
	id INTEGER UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	owner VARCHAR(100),
	timeout INTEGER UNSIGNED,
	created INTEGER,
	token VARCHAR(100),
	scope TINYINT,
	depth TINYINT,
	uri text
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE calendarobjects (
	id INTEGER UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	calendardata MEDIUMBLOB,
	uri VARCHAR(200),
	calendarid INTEGER UNSIGNED NOT NULL,
	lastmodified INT(11),
	UNIQUE(calendarid, uri)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE calendars (
	id INTEGER UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	principaluri VARCHAR(100),
	displayname VARCHAR(100),
	uri VARCHAR(200),
	ctag INTEGER UNSIGNED NOT NULL DEFAULT '0',
	description TEXT,
	calendarorder INTEGER UNSIGNED NOT NULL DEFAULT '0',
	calendarcolor VARCHAR(10),
	timezone TEXT,
	components VARCHAR(20),
	UNIQUE(principaluri, uri)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE addressbooks (
	id INT(11) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	principaluri VARCHAR(255),
	displayname VARCHAR(255),
	uri VARCHAR(200),
	description TEXT,
	ctag INT(11) UNSIGNED NOT NULL DEFAULT '1',
	UNIQUE(principaluri, uri)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE cards (
	id INT(11) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	addressbookid INT(11) UNSIGNED NOT NULL,
	carddata MEDIUMBLOB,
	uri VARCHAR(200),
	lastmodified INT(11) UNSIGNED
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;