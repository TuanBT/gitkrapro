"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const program = require("commander");
program
    .name("gitkrapro-appid")
    .description("GitKraPro AppId")
    .command("generate", "generate GitKraPro AppId")
    .command("read", "read GitKraPro AppId from config")
    .parse(process.argv);
