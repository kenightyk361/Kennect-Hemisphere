# Kennect Hemisphere — 部署指南 (V60 優化版)

> 這份檔案只是給你看的說明，**不需要**部署到網站上（放進 repo 也無妨，不會被當成網頁）。

---

## 1. 檔案清單與放置位置

把以下檔案放到 GitHub repo（`kenightyk361/Kennect-Hemisphere`）**根目錄**，覆蓋舊的 `index.html`：

```
根目錄/
├── index.html              ← 取代舊版（500KB → 78KB）
├── logo.png                ← 網站 Logo（頁首/頁尾/結構化資料共用）
├── favicon.ico             ← 瀏覽器分頁圖示（多尺寸）
├── favicon-32.png
├── favicon-16.png
├── apple-touch-icon.png    ← iOS 加入主畫面圖示
├── share-card.jpg          ← 分享預覽圖（LinkedIn/WhatsApp/FB，1200×630）
├── robots.txt              ← 允許所有爬蟲 + 指向 sitemap
├── sitemap.xml             ← 網站地圖（首頁 + 3 個法務頁）
├── privacy.html            ← 隱私政策
├── terms.html              ← 服務條款
├── cookies.html            ← Cookie 政策
└── assets/
    ├── dubai-skyline.webp  ← 杜拜市場卡圖（原本是內嵌 base64）
    └── office.webp         ← 辦公室照（原本是內嵌 base64）
```

提交（commit + push）後，Cloudflare Pages 會自動重新部署。

---

## 2. ⚠️ 一定要手動替換的佔位符（我無法替你填，因為不知道你的實際值）

| 項目 | 位置 | 現在的佔位符 | 換成 |
|---|---|---|---|
| **WhatsApp 號碼** | `index.html`（搜尋 `wa.me`） | `8526XXXXXXX` | 你的真實號碼（含國碼，不含 +／空格，例：`85261234567`） |
| **LinkedIn 網址** | `index.html`（搜尋 `linkedin.com/company`） | `your-company` | 你公司 LinkedIn 頁面的網址 |
| **Analytics token** | `index.html`（搜尋 `Cloudflare Web Analytics`） | 一段被註解的程式碼 | 見下方第 4 點（或用免程式碼方式） |
| **法務頁公司資訊** | `privacy.html` / `terms.html` | `[方括號]` 內文字 | 登記地址、公司編號、適用法律地區、隱私聯絡信箱 |

> WhatsApp 號碼沒換的話，「Prefer WhatsApp」那個連結會點不開。

---

## 3. 表單（Web3Forms 免費版）— 需要你做一個決定

- ✅ Access key 已正確設定、且公開在前端是**安全**的（它只是信箱別名，不是密鑰）。
- ✅ 我已加上**蜜罐（honeypot）**防垃圾欄位，零摩擦、不影響使用者。
- ⚠️ **免費版每月上限 250 封**、提交紀錄保留 30 天。
- 🔴 **免費版不支援檔案上傳**。你表單裡的「Attach a spec, photo or PDF」欄位在免費版**不會把檔案送達**。請二擇一：
  - **(A) 先移除該欄位**（最穩，避免客戶上傳了卻寄不到）：在 `index.html` 刪掉含 `type="file" name="attachment"` 的那一行 `<div class="full inq-file">…</div>`。
  - **(B) 升級 Web3Forms Pro**（約 US$12/月、年繳）：可支援附件、每月 10,000 封、進階防垃圾。對 B2B 採購（客戶常要附規格/圖）這筆錢通常值得。
- （選用）若日後垃圾訊息變多，可加 hCaptcha；缺點是會增加一道驗證、降低轉換率，量不大時用蜜罐即可。

---

## 4. 分析工具（原本沒裝，現已備好）

建議用 **Cloudflare Web Analytics**（免 Cookie、不需同意彈窗、對 GDPR 友善）。兩種啟用方式擇一：

- **方式一（免改程式碼，推薦）**：Cloudflare 後台 → **Web Analytics** → 加入網站 `kshemisphere.com` → 因為你已用 Cloudflare，會自動注入，不必動 `index.html`。
- **方式二（手動）**：到同一頁複製你的 beacon token，打開 `index.html` 找到結尾 `<!-- Cloudflare Web Analytics … -->` 註解，把 `REPLACE_WITH_YOUR_CLOUDFLARE_WEB_ANALYTICS_TOKEN` 換成你的 token，並把註解符號移除讓它生效。

---

## 5. SEO / 爬蟲 — 讓 Google 找得到（重點步驟）

你目前的 HTML **沒有** `noindex`，所以不是被網頁本身擋住。我之前抓站被 `robots disallowed` 多半是 **Cloudflare 對「自動化抓取程式」的防護**在攔我（Cloudflare 預設會放行已驗證的 Googlebot，不影響 Google 收錄）。Google 搜不到，主因是**網站還新、從未提交、且先前沒有 sitemap**。已處理 + 待你做：

1. ✅ 已建立 `robots.txt`（允許全部 + 指向 sitemap）與 `sitemap.xml`。
2. **Google Search Console**（`https://search.google.com/search-console`）：
   - 新增資源 → 選 **網域 (Domain)** → 輸入 `kshemisphere.com`。
   - 用 **DNS TXT 驗證**（最簡單，你本來就管 Cloudflare DNS）：把 Google 給的 TXT 記錄加到 Cloudflare DNS → 回 GSC 按驗證。
   - 驗證後：**Sitemaps** → 提交 `https://www.kshemisphere.com/sitemap.xml`；再用「網址審查」對首頁按「要求建立索引」。
3. **Bing Webmaster Tools**（`https://www.bing.com/webmasters`）：可直接從 Google Search Console 匯入，並提交同一個 sitemap。
4. 確認 **non-www → www 轉址**：你的標準網址是 `https://www.kshemisphere.com/`。在 Cloudflare 用一條 Redirect Rule 把 `kshemisphere.com` 轉到 `www`，避免兩個版本分散權重。
5. 收錄通常要數天到數週。早期靠 LinkedIn、產業名錄、直接接觸會比自然搜尋更快帶來詢盤。

---

## 6. 這次改了什麼（摘要）

- **圖片/速度**：抽出 3 張內嵌 base64 圖（Logo、杜拜、辦公室）改為獨立檔；杜拜/辦公室轉 WebP；首頁 HTML 由 **500KB→78KB**；Hero 圖加 `fetchpriority=high` + `srcset`；大圖加 `srcset`/`sizes`；圖片 CDN 加 `preconnect`；外部 Unsplash/Pexels 圖維持外部（本就壓縮過、且 bash 無法下載）— 顯示完全不變。
- **手機版**：原本 ≤900px 時整個導覽列（含「Brief Us」）會消失。已加上**漢堡選單**（無障礙、Esc 可關、尊重 reduced-motion）。其餘 RWD 本來就做得不錯。
- **標題/SEO**：標題改為關鍵字前置版本，並強化 description。
- **favicon / logo.png / share-card**：用你的品牌圖產生整套。
- **法務頁**：新增 Privacy / Terms / Cookie 三頁並接上頁尾連結。
- **表單**：加蜜罐；標出免費版檔案上傳限制。
- **分析**：備好 Cloudflare Web Analytics。

> 法務頁為**範本、非法律意見**，上線前請給律師確認（尤其 GDPR 與適用法律）。
