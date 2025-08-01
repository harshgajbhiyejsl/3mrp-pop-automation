/* ───────────────  PHASE-3  WIDE TABLES  ─────────────── */

/* 1️⃣  Full-fidelity MRP table */
DROP TABLE IF EXISTS mrp_clean_wide;
CREATE TABLE mrp_clean_wide (
    segment          text,
    plant            text,
    deptt            text,
    product          text,
    product_2        text,
    sub_product      text,
    grade            text,
    finish           text,
    series           text,
    jul              numeric,
    aug              numeric,
    sep              numeric,
    upload_date      date,       -- parsed from filename
    file_hash        char(64)    -- SHA-256 for dedup
);

/* 2️⃣  Full-fidelity POP table */
DROP TABLE IF EXISTS pop_clean_wide;
CREATE TABLE pop_clean_wide (
    plant                  text,
    sgrp                   text,
    product                text,
    status                 text,
    sale_group             text,
    sold_to_party          text,
    sold_to_party_name     text,
    so                     text,
    item                   text,
    so_date                date,
    effective_so_date      date,
    grade                  text,
    thick                  numeric,
    width                  numeric,
    length                 numeric,
    finish                 text,
    edge_con               text,
    quality                text,
    basic_rate             numeric,
    ord_qty                numeric,
    open_qty               numeric,
    desp_qty               numeric,
    mkt_bal                numeric,
    assign_to_delivery     text,
    alloc_qty              numeric,
    alloc_qty_tpi          numeric,
    csm_bal                numeric,
    header_po_no           text,
    description01          text,
    ship_to_party_name     text,
    csm_remarks            text,
    customer_req_delv      date,
    cam_name               text,
    divn                   text,
    doc_type               text,
    sales_off              text,
    series                 text,
    segment                text,
    ref_1                  text,
    thk_tol_l              numeric,
    thk_tol_u              numeric,
    part_wt_min            numeric,
    part_wt_max            numeric,
    vector_due_date_2      date,
    vector_due_date_1      date,
    system_proposed_date   date,
    coil_id                text,
    ni_pct                 numeric,
    ni_booked              numeric,
    mo_pct                 numeric,
    mo_booked              numeric,
    gr_group               text,
    gr_description         text,
    market_ind_description text,
    mou_ind                text,
    mou_no                 text,
    mou_qty                numeric,
    item_po_date           date,
    ilp                    text,
    pvc                    text,
    district               text,
    header_po_date         date,
    price_group            text,
    sorg                   text,
    exports_priority_desc  text,
    legacy_so_item         text,
    soic                   text,
    days                   numeric,
    pop                    numeric,
    prod_1                 numeric,
    prod_2                 numeric,
    prod_3                 numeric,
    crdd_month             text,
    txn_date               date,       -- parsed from filename
    file_hash              char(64)
);

/* 3️⃣  Central lineage table (if not yet present) */
CREATE TABLE IF NOT EXISTS upload_versions (
    file_hash    char(64) PRIMARY KEY,
    table_name   text      NOT NULL,
    upload_date  date      NOT NULL,
    row_count    integer   NOT NULL,
    processed_at timestamp DEFAULT now()
);

/* Helpful indexes */
CREATE INDEX IF NOT EXISTS idx_mrp_upload ON mrp_clean_wide(upload_date);
CREATE INDEX IF NOT EXISTS idx_pop_txn    ON pop_clean_wide(txn_date);
