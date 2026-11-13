export function splitHeadingText(text: string | number | null | undefined) {
  return String(text ?? '').split(/(\p{Script=Latin}[\p{Script=Latin}\p{N}\s&+.'’/:()–—-]*)/gu)
    .filter(Boolean)
    .map(text => ({ text, english: /^\p{Script=Latin}/u.test(text) }))
}
