import fetch from 'isomorphic-unfetch'

const Item = (props) => (
  <div>
    <h1>{props.item.name}</h1>
  </div>
)

Item.getInitialProps = async function (context) {
  const { id } = context.query
  const res = await fetch(`https://yaws-nextjs-server.now.sh/api/${id}`)
  const item = await res.json()

  console.log(`Fetched item: ${item.name}`)

  return { item }
}

export default Item