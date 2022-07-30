CREATE DATABASE "banco_pratica";

CREATE TABLE states (
	id SERIAL NOT NULL PRIMARY KEY,
	name TEXT NOT NULL
);

CREATE TABLE cities (
	id SERIAL NOT NULL PRIMARY KEY,
	name TEXT NOT NULL,
	"stateId" INTEGER REFERENCES states(id)
);

CREATE TABLE "customers" (
	id SERIAL NOT NULL PRIMARY KEY,
	"fullName" VARCHAR(50) NOT NULL,
	cpf VARCHAR(11) NOT NULL UNIQUE,
	email TEXT NOT NULL UNIQUE,
	password TEXT NOT NULL
);

CREATE TABLE "customerAddresses" (
	id SERIAL NOT NULL PRIMARY KEY,
	"customerId" INTEGER REFERENCES customers(id),
	street TEXT NOT NULL,
	number TEXT NOT NULL,
	complement TEXT,
	postalCode TEXT NOT NULL,
	"cityId" INTEGER REFERENCES cities(id)
);

CREATE TABLE "customerPhones" (
	id SERIAL NOT NULL PRIMARY KEY,
	"customerId" INTEGER REFERENCES customers(id),
	number VARCHAR(11) NOT NULL,
	type TEXT
);

CREATE TABLE "bankAccount" (
	id SERIAL NOT NULL PRIMARY KEY,
	"customerId" INTEGER REFERENCES customers(id),
	"accountNumber" INTEGER NOT NULL UNIQUE,
	agency TEXT NOT NULL,
	"openDate" DATE NOT NULL DEFAULT NOW(),
	"closeDate" DATE NOT NULL DEFAULT NOW()
);

CREATE TABLE "transactions" (
	id SERIAL NOT NULL PRIMARY KEY,
	"bankAccountId" INTEGER REFERENCES "bankAccount"(id),
	amount INTEGER NOT NULL,
	type TEXT NOT NULL,
	time TIMESTAMP NOT NULL DEFAULT NOW(),
	description TEXT,
	cancelled BOOLEAN NOT NULL DEFAULT FALSE
);