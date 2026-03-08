import * as program from "commander";

import {Logo} from "../";

program
  .name("gitkrapro-about")
  .description("about GitKraPro")
  .action(() => {
    Logo.print();
  })
  .parse(process.argv);
