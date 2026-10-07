import type { APIRoute } from "astro";

const FILE = "sheetbird-0.1.0.xpi";

// Firefox tries to install .xpi files served as application/x-xpinstall,
// so re-serve the static file as a plain attachment to force a download.
export const GET: APIRoute = async ({ url }) => {
  const res = await fetch(new URL(`/sheetbird/${FILE}`, url));
  if (!res.ok) return new Response("not found", { status: 404 });
  return new Response(res.body, {
    headers: {
      "Content-Type": "application/octet-stream",
      "Content-Disposition": `attachment; filename="${FILE}"`,
      "Cache-Control": "public, max-age=300",
      "X-Robots-Tag": "noindex",
    },
  });
};
