import Link from 'next/link'
import fetch from 'isomorphic-unfetch'

const Index = (props) => (
  <div>
    <h1>Items</h1>
    <ul>
      {props.items.map((item) => (
        <li key={item.id}>
          <Link as={`/item/${item.id}`} href={`/item?id=${item.id}`}>
            <a>{item.name}</a>
          </Link>
        </li>
      ))}
    </ul>
  </div>
)

Index.getInitialProps = async function () {
  const res = await fetch('https://yaws-nextjs-server.now.sh/api')
  const data = await res.json()

  console.log(`Items data fetched. Count: ${data.length}`)

  return {
    items: data
  }
}

export default Index