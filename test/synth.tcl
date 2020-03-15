remove_design -all
set link_library []
# This script was generated automatically by bender.
set search_path_initial $search_path
set ROOT "/home/zarubaf/common_cells"

set search_path $search_path_initial
lappend search_path "$ROOT/include"

analyze -format sv \
    -define { \
        TARGET_SYNOPSYS \
        TARGET_SYNTHESIS \
        TARGET_SYNTH_TEST \
    } \
    [list \
        "$ROOT/.bender/git/checkouts/tech_cells_generic-0bad0132c3cc22f2/src/deprecated/cluster_clk_cells.sv" \
        "$ROOT/.bender/git/checkouts/tech_cells_generic-0bad0132c3cc22f2/src/deprecated/pulp_clk_cells.sv" \
        "$ROOT/.bender/git/checkouts/tech_cells_generic-0bad0132c3cc22f2/src/rtl/tc_clk.sv" \
    ]

set search_path $search_path_initial
lappend search_path "$ROOT/include"

analyze -format sv \
    -define { \
        TARGET_SYNOPSYS \
        TARGET_SYNTHESIS \
        TARGET_SYNTH_TEST \
    } \
    [list \
        "$ROOT/src/addr_decode.sv" \
        "$ROOT/src/cdc_2phase.sv" \
        "$ROOT/src/cf_math_pkg.sv" \
        "$ROOT/src/clk_div.sv" \
        "$ROOT/src/delta_counter.sv" \
        "$ROOT/src/ecc_pkg.sv" \
        "$ROOT/src/edge_propagator_tx.sv" \
        "$ROOT/src/exp_backoff.sv" \
        "$ROOT/src/fifo_v3.sv" \
        "$ROOT/src/graycode.sv" \
        "$ROOT/src/lfsr.sv" \
        "$ROOT/src/lfsr_16bit.sv" \
        "$ROOT/src/lfsr_8bit.sv" \
        "$ROOT/src/lzc.sv" \
        "$ROOT/src/mv_filter.sv" \
        "$ROOT/src/onehot_to_bin.sv" \
        "$ROOT/src/plru_tree.sv" \
        "$ROOT/src/popcount.sv" \
        "$ROOT/src/rr_arb_tree.sv" \
        "$ROOT/src/rstgen_bypass.sv" \
        "$ROOT/src/serial_deglitch.sv" \
        "$ROOT/src/shift_reg.sv" \
        "$ROOT/src/spill_register.sv" \
        "$ROOT/src/stream_demux.sv" \
        "$ROOT/src/stream_filter.sv" \
        "$ROOT/src/stream_fork.sv" \
        "$ROOT/src/stream_mux.sv" \
        "$ROOT/src/sub_per_hash.sv" \
        "$ROOT/src/sync.sv" \
        "$ROOT/src/sync_wedge.sv" \
        "$ROOT/src/unread.sv" \
        "$ROOT/src/cb_filter.sv" \
        "$ROOT/src/cdc_fifo_2phase.sv" \
        "$ROOT/src/cdc_fifo_gray.sv" \
        "$ROOT/src/counter.sv" \
        "$ROOT/src/ecc_decode.sv" \
        "$ROOT/src/ecc_encode.sv" \
        "$ROOT/src/edge_detect.sv" \
        "$ROOT/src/id_queue.sv" \
        "$ROOT/src/max_counter.sv" \
        "$ROOT/src/rstgen.sv" \
        "$ROOT/src/stream_delay.sv" \
        "$ROOT/src/fall_through_register.sv" \
        "$ROOT/src/stream_arbiter_flushable.sv" \
        "$ROOT/src/stream_register.sv" \
        "$ROOT/src/stream_arbiter.sv" \
    ]

set search_path $search_path_initial
lappend search_path "$ROOT/include"

analyze -format sv \
    -define { \
        TARGET_SYNOPSYS \
        TARGET_SYNTHESIS \
        TARGET_SYNTH_TEST \
    } \
    [list \
        "$ROOT/test/cdc_2phase_synth.sv" \
        "$ROOT/test/id_queue_synth.sv" \
        "$ROOT/test/stream_arbiter_synth.sv" \
        "$ROOT/test/ecc_synth.sv" \
        "$ROOT/test/synth_bench.sv" \
    ]

set search_path $search_path_initial
lappend search_path "$ROOT/include"

analyze -format sv \
    -define { \
        TARGET_SYNOPSYS \
        TARGET_SYNTHESIS \
        TARGET_SYNTH_TEST \
    } \
    [list \
        "$ROOT/src/deprecated/clock_divider_counter.sv" \
        "$ROOT/src/deprecated/find_first_one.sv" \
        "$ROOT/src/deprecated/generic_LFSR_8bit.sv" \
        "$ROOT/src/deprecated/generic_fifo.sv" \
        "$ROOT/src/deprecated/prioarbiter.sv" \
        "$ROOT/src/deprecated/pulp_sync.sv" \
        "$ROOT/src/deprecated/pulp_sync_wedge.sv" \
        "$ROOT/src/deprecated/rrarbiter.sv" \
        "$ROOT/src/deprecated/clock_divider.sv" \
        "$ROOT/src/deprecated/fifo_v2.sv" \
        "$ROOT/src/deprecated/fifo_v1.sv" \
        "$ROOT/src/edge_propagator.sv" \
        "$ROOT/src/edge_propagator_rx.sv" \
    ]

set search_path $search_path_initial
elaborate synth_bench
