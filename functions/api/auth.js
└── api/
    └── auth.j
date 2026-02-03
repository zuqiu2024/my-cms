export async function onRequest(context) {
  const url = new URL(context.request.url);
  const code = url.searchParams.get("code");

  return fetch("https://github.com/login/oauth/access_token", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({
      client_id: context.env.OAUTH_CLIENT_ID,
      client_secret: context.env.OAUTH_CLIENT_SECRET,
      code,
    }),
  });
}
