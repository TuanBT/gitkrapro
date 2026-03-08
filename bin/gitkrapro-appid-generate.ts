import chalk from "chalk";
import * as program from "commander";

import {AppId, Logo} from "../";

program
  .name("gitkrapro-appid-generate")
  .description("generate GitKraPro AppId")
  .option("-m, --mac <value>", "use specific mac address (or any other string)")
  .action(async () => {
    Logo.print();
    console.log(
      `${chalk.green("==>")} Generated AppId ${chalk.green(
        program.mac ? AppId.generate(program.mac) : await AppId.generateAsync(),
      )}`,
    );
  })
  .parse(process.argv);
