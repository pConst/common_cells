// Description: Contains common ECC definitions and helper functions.

// Author: Florian Zaruba
package ecc_pkg;

  // Calculate required ECC parity width:
  function automatic int unsigned get_cw_width (input int unsigned data_width);
    // data_width + cw_width + 1 <= 2**cw_width
    int unsigned cw_width = 2;
    while (2**cw_width < cw_width + data_width + 1) cw_width++;
    return cw_width;
  endfunction

endpackage