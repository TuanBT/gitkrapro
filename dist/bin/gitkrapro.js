#!/usr/bin/env node
"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const program = require("commander");
const global_1 = require("../global");
program
    .name("gitkrapro")
    .version(global_1.packageJson.version)
    .description(global_1.packageJson.description)
    .command("about", "about GitKraPro")
    .command("appid", "GitKraPro AppId")
    .command("patcher [actions...]", "GitKraPro patcher")
    .command("secfile [files...]", "read GitKraPro secFile")
    .parse(process.argv);
