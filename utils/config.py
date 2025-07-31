from pathlib import Path
import os

BASE_DIR          = Path(__file__).resolve().parents[1]
POP_UPLOAD_DIR    = Path(os.getenv("POP_UPLOAD_DIR",  BASE_DIR / "data_raw" / "pop"))
MRP_UPLOAD_DIR    = Path(os.getenv("MRP_UPLOAD_DIR",  BASE_DIR / "data_raw" / "mrp"))
ARCHIVE_DIR       = BASE_DIR / "archives"
DATE_FMT_DMY      = "%d%m%Y"       # 01072025
DATE_FMT_ISO      = "%Y-%m-%d"     # 2025-07-01
