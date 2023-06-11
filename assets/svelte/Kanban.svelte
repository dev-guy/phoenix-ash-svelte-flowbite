<script>
  import Kanban from 'svelte-kanban';

  const colsList = [{
			name: 'New',
			cards:[{
        empty: false,
        title: "Me",
        description: "Me",
        category: {label:'new', bgColor:'gray', color:'white'}
      },],
		},
	];
</script>

<Kanban theme='light' colsList={colsList}/>
