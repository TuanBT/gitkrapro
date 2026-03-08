"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const program = require("commander");
const __1 = require("../");
program
    .name("gitkrapro-about")
    .description("about GitKraPro")
    .action(() => {
    __1.Logo.print();
})
    .parse(process.argv);
